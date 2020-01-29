FROM amazonlinux:2

ENV GATLING_VERSION 3.0.2
ENV GATLING_HOME /var/gatling
ENV PATH ${PATH}:${GATLING_HOME}/bin

RUN yum install -y procps net-tools unzip java-1.8.0-openjdk

RUN mkdir ${GATLING_HOME}
WORKDIR /tmp

RUN curl -OL https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip \
 && unzip ./gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip \
 && mv ./gatling-charts-highcharts-bundle-${GATLING_VERSION}/* ${GATLING_HOME}/ \
 && rm -rf ./gatling-charts-highcharts-bundle-${GATLING_VERSION}* \
 && sed -i -e 's/#connectTimeout = 60000/connectTimeout = 300000/' ${GATLING_HOME}/conf/gatling.conf \
 && sed -i -e 's/#handshakeTimeout = 60000/handshakeTimeout = 300000/' ${GATLING_HOME}/conf/gatling.conf

VOLUME ["${GATLING_HOME}/conf", "${GATLING_HOME}/results", "${GATLING_HOME}/user-files"]
