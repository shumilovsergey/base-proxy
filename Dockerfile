# Use the official Squid image
FROM ubuntu/squid:latest

# Copy the custom Squid configuration file into the container
COPY squid.conf /etc/squid/squid.conf

# Expose the port Squid will listen on
EXPOSE 8889

# Run Squid in the foreground
CMD ["squid", "-N"]

