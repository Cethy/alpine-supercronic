FROM alpine:3.6

# Copy crontab file in the cron directory
COPY ./crontab /etc/crontabs/crontab

# Copy start script
COPY ./start.sh /app/start.sh
# Ensure the start script is executable
RUN chmod +x /app/start.sh

# Configure crontab & run crond at container startup
CMD ["sh", "/app/start.sh"]
