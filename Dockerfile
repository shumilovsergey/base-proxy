# Use the official Squid image
FROM ubuntu/squid:latest

# Copy custom configuration file to the Squid configuration directory
COPY squid.conf /etc/squid/squid.conf

# Expose the port
EXPOSE 8888
