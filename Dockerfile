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

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    ln -sf /dev/stdout /var/log/stunnel4/stunnel.log
    
#Setup Streaming Services Details
#Facebook
ENV FACEBOOK_URL rtmp://localhost:19350/rtmp/
ENV FACEBOOK_KEY ""

#Restream.io
ENV RESTREAM_URL rtmp://live.restream.io/live/
ENV RESTREAM_KEY ""

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 1935

ENTRYPOINT ["entrypoint.sh"]

# Initialise nginx
CMD ["nginx", "-g", "daemon off;"]
