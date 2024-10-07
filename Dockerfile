
FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y squid python3 && \
    apt-get clean


COPY squid.conf /etc/squid/squid.conf
COPY session_timeout.py /usr/local/bin/session_timeout.py

RUN chmod +x /usr/local/bin/session_timeout.py

EXPOSE 8889

CMD ["squid", "-N"]




