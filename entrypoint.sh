#!/bin/bash

set -e


if [ -n "${FACEBOOK_KEY}" ]; then
	echo "Facebook activated"
	FACEBOOK_KEY_esc=$(echo "$FACEBOOK_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#facebook|push '"$FACEBOOK_URL""$FACEBOOK_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Facebook stream key set... disabling"
    sed -i 's|#facebook| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${RESTREAM_KEY}" ]; then
	echo "Restream.io activated"
	RESTREAM_KEY_esc=$(echo "$RESTREAM_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#restream|push '"$RESTREAM_URL""$RESTREAM_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Restream.io stream key set... disabling"
    sed -i 's|#restream| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${YOUTUBE_KEY}" ]; then
	echo "YouTube activated"
	YOUTUBE_KEY_esc=$(echo "$YOUTUBE_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#youtube|push '"$YOUTUBE_URL""$YOUTUBE_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No YouTube stream key set... disabling"
    sed -i 's|#youtube| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${TWITCH_KEY}" ]; then
	echo "Twitch.tv activated"
	TWITCH_KEY_esc=$(echo "$TWITCH_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#twitch|push '"$TWITCH_URL""$TWITCH_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Twitch.tv stream key set... disabling"
    sed -i 's|#twitch| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${MIXCLOUD_KEY}" ]; then
	echo "Mixcloud activated"
	MIXCLOUD_KEY_esc=$(echo "$MIXCLOUD_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#mixcloud|push '"$MIXCLOUD_URL""$MIXCLOUD_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Mixcloud stream key set... disabling"
    sed -i 's|#mixcloud| |g' /etc/nginx/nginx.conf 
fi


stunnel4

exec "$@"
