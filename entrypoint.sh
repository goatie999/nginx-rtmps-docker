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
	sed -i 's|#restream|push '"$RESTREAM_URL""$RESTREAM_KEY"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Restream.io stream key set... disabling"
    sed -i 's|#restream| |g' /etc/nginx/nginx.conf 
fi

stunnel4

exec "$@"
