FROM alpine:3.21.2

# Install rsyslog
RUN apk add --no-cache rsyslog

# Copy custom rsyslog config
COPY config/rsyslog.conf /etc/rsyslog.conf

# Expose syslog ports
EXPOSE 514/udp 514/tcp

# Run rsyslog
CMD ["rsyslogd", "-n"]
