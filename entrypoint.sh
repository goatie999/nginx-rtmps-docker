#!/bin/bash

set -e

if [ -n "${YOUTUBE_KEY}" ]; then
	echo "Youtube activate."
	sed -i 's|#youtube|push '"$YOUTUBE_URL""$YOUTUBE_KEY"';|g' /etc/nginx/nginx.conf
else
	sed -i 's|#youtube| |g' /etc/nginx/nginx.conf
fi

if [ -n "${FACEBOOK_KEY}" ]; then
	echo "Facebook activate."
	sed -i 's|#facebook|push '"$FACEBOOK_URL""$FACEBOOK_KEY"';|g' /etc/nginx/nginx.conf 
else 
    sed -i 's|#facebook| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${INSTAGRAM_KEY}" ]; then
	echo "Instagram activate."
	sed -i 's|#instagram|push '"$INSTAGRAM_URL""$INSTAGRAM_KEY"';|g' /etc/nginx/nginx.conf 
else 
    sed -i 's|#instagram| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${TWITCH_KEY}" ]; then
	echo "Twitch activate."
	sed -i 's|#twitch|push '"$TWITCH_URL""$TWITCH_KEY"';|g' /etc/nginx/nginx.conf 
else 
    sed -i 's|#twitch| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${RESTREAM_KEY}" ]; then
	echo "Restream.io activate."
	sed -i 's|#restream|push '"$RESTREAM_URL""$RESTREAM_KEY"';|g' /etc/nginx/nginx.conf 
else 
    sed -i 's|#restream| |g' /etc/nginx/nginx.conf 
fi


stunnel4

exec "$@"
