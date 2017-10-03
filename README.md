Alpine-supercronic
===

Simple docker image based on alpine 3.6. 

Run [supercronic](https://github.com/aptible/supercronic).

## How to use
### `docker run`

#### Default

    docker run -ti -v <host/path/to/crontab>:/etc/crontabs cethy/alpine-supercronic:v1.0

The crontab file must be named `crontab`.

#### Full configuration

    docker run -ti -v <host/path/to/crontab>:<container/path/to/crontab> cethy/alpine-supercronic:v1.0 <container/path/to/crontab><crontab_name>

### Dockerfile inheritance
Create a `Dockerfile` like this :

    FROM cethy/alpine-supercronic:v1.0
    
    # Copy crontab file in the cron directory
    COPY ./crontab /etc/crontab
    RUN chmod 0644 /etc/crontab
    
    CMD ["/etc/crontab"]

then :

    docker build -t my_supercronic . && docker run my_supercronic
