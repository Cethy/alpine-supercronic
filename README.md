Alpine-cron
===

Simple docker image based on alpine3.6. 

- copy crontab file
- configure crontab to run the new file
- run `crond -f` at startup

## How to use (needs confirmation)
Create a Dockerfile which overrides the `/etc/crontabs/crontab` file :

    FROM alpine-cron:latest
    
    # Overrides crontab file
    COPY ./my-new-crontab /etc/crontabs/crontab
    # Re give execution rights on the cron job ?
    RUN chmod 0644 /etc/crontabs/crontab
