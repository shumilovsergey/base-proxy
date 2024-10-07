# Use the official Squid image
FROM ubuntu/squid:latest

# Copy the Squid configuration and session script
COPY squid.conf /etc/squid/squid.conf
COPY session_timeout.py /usr/local/bin/session_timeout.py

# Make the Python script executable
RUN chmod +x /usr/local/bin/session_timeout.py

# Expose the port Squid will listen on
EXPOSE 8889

# Run Squid in the foreground
CMD ["squid", "-N"]




