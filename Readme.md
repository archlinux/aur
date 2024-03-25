Sabnzbd-docker
==============

`sabnzbd-docker` is a service unit that starts `sabnzbd`, `nzbhydra2` and `sonarr` in their respective docker
containers.

The services are provided as-is by linuxserver.io, direct from docker hub:
* [sabnzbd](https://hub.docker.com/r/linuxserver/sabnzbd)
* [nzbhydra2](https://hub.docker.com/r/linuxserver/nzbhydra2)
* [sonarr](https://hub.docker.com/r/linuxserver/sonarr)

This package is ArchLinux centric, but it should work on any system that uses `systemd` and `docker`.

An [Aur package](https://aur.archlinux.org/packages/sabnzbd-docker) is provided for easy installation.

## Configuration

1. Create a user config file at `~/.docker-sabnzbd.env` with the following content:

        # you may choose different paths for each service

        SABNZBD_PATH_PREFIX   = /path/to/prefix
        NZBHYDRA2_PATH_PREFIX = /path/to/prefix
        SONARR_PATH_PREFIX    = /path/to/prefix

      <details>
      For example, you can run it with something like:
   
         cat ~/.docker-sabnzbd.env

         TZ=Europe/Madrid
         COMPOSE_PROFILES=sabnzbd,nzbhydra2                    # does not start sonarr
         
         SABNZBD_PATH_PREFIX=/data/banjo/Downloads/sabnzbd     # config and logs
         SABNZBD_PATH_DOWNLOADS=/data/banjo/Downloads          # downloads will go one level up
         
         NZBHYDRA2_PATH_PREFIX=/data/banjo/Downloads/nzbhydra2 # config, logs and everything
      </details>

2. Create the following directories (for services you choose to run):

        # Sabnzbd
        mkdir -p /path/to/prefix/sabnzbd/config      # /config
        mkdir -p /path/to/prefix/sabnzbd/temp        # /incomplete-downloads
        mkdir -p /path/to/prefix/sabnzbd/downloads   # /downloads

        # NZBHydra2
        mkdir -p /path/to/prefix/nzbhydra2/config    # /config 

        # Sonarr
        mkdir -p /path/to/prefix/sonarr/config       # /config
        mkdir -p /path/to/prefix/sonarr/tv           # /tv
        mkdir -p /path/to/prefix/sonarr/downloads    # /downloads

3. _Optional._ Defines the services to start in the same user config file:

        COMPOSE_PROFILES=sabnzbd,nzbhydra2,sonarr # default is 'all'

4. _Optional._ Set the ports for the services in the same user config file:

        SABNZBD_PORT   = 8080
        NZBHYDRA2_PORT = 5076
        SONARR_PORT    = 8989

## Installation

      makepkg      

      pacman -U sabnzbd-docker-x.y-z-x86_64.pkg.tar.zst

## Usage

      # Optional. sabnzbd-docker-update.timer pull new updates from docker hub each day
      systemctl --user start sabnzbd-docker-update.timer
      systemctl --user enable sabnzbd-docker-update.timer

      systemctl --user start sabnzbd-docker
      systemctl --user enable sabnzbd-docker

Navigate to [http://localhost:8080](http://localhost:8080) to access `sabnzbd`.

Configure `sabnzbd`, `nzbhydra2` and `sonarr` to use the mapped directories defined in step 2.