FROM debian:bullseye-slim

LABEL maintainer="Mark Ley"

# Update and Load initial packages
RUN apt-get update && \
	apt-get install -y nano nginx libnginx-mod-rtmp stunnel4

# Import setting files and set new files
COPY nginx.setup /etc/nginx/nginx.setup
COPY stunnel.setup /etc/stunnel/stunnel.conf
RUN touch /var/log/stunnel4/stunnel.log


# Make any configuration changes to nginx anf stunnel
# RUN more /etc/nginx/nginx.setup >> /etc/nginx/nginx.conf
RUN echo "ENABLED=1" >> /etc/default/stunnel4

# Expose services to host
EXPOSE 1935

# Initialise Services
RUN stunnel /etc/stunnel/stunnel.conf
CMD ["nginx", "-g", "daemon off;"]
