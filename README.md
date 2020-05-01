# nginx-rtmps-docker

Docker container to enable local multi-streaming to different services via RTMP and RTMPS

As of release **v0.2.7** / **latest**, this container is set to utilise these services, **[Restream.io](https://restream.io/?ref=qQ6BR)**, **[Facebook Live](https://www.facebook.com/live/producer)** **[YouTube](https://youtube.com)**, **[Twitch](https://twitch.tv)** and **[Mixcloud](https://www.mixcloud.com/)**.  

This container makes use of _stunnel4_ in order to work with Facebook's specification that only supports RTMPS.  Stunnel4 is built as an internal service within this container to make this function correctly.

I'm setting this up with the intention that people host the container on a Synology NAS but it also runs just fine from other Docker setups (i.e. I've tested using Docker on OSX).

You don't have to use all of the providers in this setup, any that you leave the stream key value blank for will be disabled when the container starts.



 ## SYNOLOGY INSTRUCTIONS:

1. If you're using the Synology GUI, once you have downloaded the required release from the 'Registry' (**goatie999/nginx-rtmps:\<tag\>**), launch container from the 'Image' menu.

2. From the 'Create Container' window, rename the container as required and click the 'Advanced Settings' button.

3. From the 'Port Settings' tab, define the **'Local Port'** number that you'd like to access the container via, or leave as Auto if you don't mind Synology changing this each time you restart the container.

4. Open the 'Environment' tab.  Here's the most critical part.  Here you must enter your unique Stream Key(s) for the services that you want the container to multi-stream to.  To this by locating your stream key from the settings of your streaming service provider(s) and copy/paste your stream key into the relevant **'Value'** section for the **\<Provider\>\_KEY** variable.

5. _It is not required but if you do want to update the URL used for the streaming provider (i.e. to set a specific geoprahic ingest server for that provider), then you can do this from the 'Environment' tab also._

6. Click 'Apply' / 'Next' / 'Apply' and you're nginx-rtmps container should start.



## COMMAND LINE INSTRUCTIONS:

If you're headed down the command line route, I'm assuming that you have a good idea of what Docker is and how it works.  However, just in case that's not the case, the simplest way to get Docker installed on your Windows PC or Mac it to head over to the **[Docker](https://www.docker.com/products/docker-desktop)** website and download / installed their packaged setups.

* Streaming Providers: **FACEBOOK**, **RESTREAM**, **MIXCLOUD**, **YOUTUBE**, **TWITCH**
* Available environment variables:
    **\<Provider\>\_URL** - these are pre-defined for you and don't specifically need to be used.  They are provided in case alterations are required before I get up update the official release.
    **\<Provider\>\_KEY** - how you define your unique stream key that the container will consume on start
```bash
docker run -d -p <your port>:1935 
   -e <Provider1>_KEY=<your Provider 1 stream key> 
   -e <Provider2>_KEY=<your Provider 2 stream key> 
   goatie999/nginx-rtmps:<tag>
```


## STREAMING SOFTWARE SETUP:

This should work for any streaming software that allows you to define a custom RTMP streaming server.  I've tested with OBS and Streamlabs OBS (SLOBS).  Within the settings of the streaming software, set the stream server to be:
```bash
rtmp://<Server IP Address / FQDN>:<Chosen Port Number>/live
```
The _Stream Key_ field in OBS / SLOBS can be left blank

Save your setting and you're now ready to 'go-live!'




## Thanks and Links:

Thanks to [thiagoeolima/nginx-rtmps](https://github.com/thiagoeolima/nginx-rtmps) and [JasonRivers/Docker-nginx-rtmp](https://github.com/JasonRivers/Docker-nginx-rtmp) for inspiration and code snippets to get my container operational as I wanted / needed it.

Docker Hub: https://hub.docker.com/r/goatie999/nginx-rtmps

GitHub: https://github.com/goatie999/nginx-rtmps-docker


Restream.io affiliate link: https://restream.io/?ref=qQ6BR
