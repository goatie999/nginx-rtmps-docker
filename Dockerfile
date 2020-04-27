FROM debian:bullseye-slim

LABEL maintainer="Mark Ley - report issues & requests here https://github.com/goatie999/nginx-rtmps-docker"

# Update and Load initial packages
RUN apt-get update && \
	apt-get install -y nano nginx libnginx-mod-rtmp stunnel4

# Import setting files and set new files
COPY nginx.conf /etc/nginx/nginx.conf
COPY stunnel.conf /etc/stunnel/stunnel.conf
RUN touch /var/log/stunnel4/stunnel.log


# Make any configuration changes to nginx anf stunnel
# RUN more /etc/nginx/nginx.setup >> /etc/nginx/nginx.conf
RUN echo "ENABLED=1" >> /etc/default/stunnel4

# Expose services to host
EXPOSE 1935

# Initialise Services
CMD ["stunnel, "/etc/stunnel/stunnel.conf"]
CMD ["nginx", "-g", "daemon off;"]
