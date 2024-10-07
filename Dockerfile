# Use the official Squid image as a base
FROM ubuntu:latest

# Install Squid and Python
RUN apt-get update && \
    apt-get install -y squid python3 && \
    apt-get clean

# Copy the Squid configuration and session script
COPY squid.conf /etc/squid/squid.conf
COPY session_timeout.py /usr/local/bin/session_timeout.py

# Make the Python script executable
RUN chmod +x /usr/local/bin/session_timeout.py

# Expose the port Squid will listen on
EXPOSE 8889

# Start Squid as the default command
CMD ["squid", "-N", "-d", "1"]
