FROM alpine:3.6

# Add crontab file in the cron directory
COPY ./crontab /etc/crontabs/crontab
# Give execution rights on the cron job
RUN chmod 0644 /etc/crontabs/crontab
# Configure crontab
RUN crontab /etc/crontabs/crontab

# Run crond at container startup
CMD ["crond", "-f"]
