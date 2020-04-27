FROM debian:bullseye-slim

LABEL maintainer="Mark Ley"

# Update and Load initial packages
RUN apt-get update && \
	apt-get install -y nano nginx libnginx-mod-rtmp stunnel4

COPY nginx.setup /etc/nginx/nginx.setup
COPY stunnel.setup /etc/stunnel/stunnel.conf

RUN more /etc/nginx/nginx.setup >> /etc/nginx/nginx.conf

RUN echo "ENABLED=1" >> /etc/default/stunnel4

RUN touch /var/logs/stunnel4/stunnel.log

EXPOSE 1935

# Initialise Services
RUN stunnel /etc/stunnel/stunnel.conf
CMD ["nginx", "-g", "daemon off;"]
