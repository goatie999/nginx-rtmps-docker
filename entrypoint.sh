#!/bin/bash

set -e


if [ -n "${FACEBOOK_KEY}" ]; then
	echo "Facebook activated"
	sed -i 's|#facebook|push '"$FACEBOOK_URL""$FACEBOOK_KEY"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Facebook stream key set... disabling"
    sed -i 's|#facebook| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${RESTREAM_KEY}" ]; then
	echo "Restream.io activated"
	sed -i 's|#restream|push '"$RESTREAM_URL""$RESTREAM_KEY"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Restream.io stream key set... disabling"
    sed -i 's|#restream| |g' /etc/nginx/nginx.conf 
fi

stunnel4

exec "$@"
