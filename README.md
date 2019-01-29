# gatling-docker

## Initializing

1. Build gatling image
```bash
$ docker build -t gatling-docker_gatling . --no-cache
```

2. Run container
```bash
$ docker run -it gatling-docker_gatling
bash-4.2# <Ctrl> + P, Q
```

3. Check container is running and Container ID
```bash
$ docker ps
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS              PORTS                      NAMES
26ced7a8dc98        gatling-docker_gatling            "/bin/bash"              12 seconds ago      Up 11 seconds                                  kind_stallman
```

3. Copy original Gatling files to local
```bash
$ docker cp <CONTAINER ID>:/var/gatling/conf conf
$ docker cp <CONTAINER ID>:/var/gatling/results results
$ docker cp <CONTAINER ID>:/var/gatling/user\-files user\-files
```

4. Stop container
```bash
$ docker stop <CONTAINER ID>
```

## Modify user-files

You can remove / add your senarios under user-files/ directory.

## Run container

```bash
$ docker-compose up -d
$ docker-compose exec gatling bash
```

## Run test

```bash
bash-4.2# gatling.sh
```

## See results

```bash
$ open results/user-files-XXX/index.html
```
