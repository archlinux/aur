### package note
Default use 3rdparty tracker list instead of orignal one.

Ours: https://trackerslist.com/best.txt from https://github.com/XIU2/TrackersListCollection
Original: https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt

Last, this repo orignal from https://github.com/AndrewMarchukov/tracker-add

# Get more trackers, get more seeders,  get more peers transmission [![](https://images.microbadger.com/badges/version/andrewmhub/transmission-tracker-add.svg)](https://microbadger.com/images/andrewmhub/transmission-tracker-add) ![Docker Pulls](https://img.shields.io/docker/pulls/andrewmhub/transmission-tracker-add.svg) ![GitHub top language](https://img.shields.io/github/languages/top/AndrewMarchukov/tracker-add.svg)
See no peers,seeds for some torrent(s)? Add more tracker(s) for Transmission

This script automatically checks new torrents and adds trackers

<details>
  <summary>FAQ:</summary>

```
Q: Requirements?
A: curl, transmission-remote or\and transmission-cli

Q: How often does this check for updates for new trackers?
A: Only when adding new torrent in transmission and only active torrents and gap 25 seconds

Q: Can I add tracker to a remote server？
A: Yes, host=host:port or host=http(s?)://host:port/transmission/
```
</details>

<details>
  <summary>Changelog</summary>
   
```
Mar 27, 2019
add tracker-add-auto-router.sh script for routers
now tracker file saved in tmp directory until update web source
new exception in "Get list of active torrents", helps to avoid fully loaded torrents
cosmetic fixes

Feb 22, 2019
add feature connection to host

May 27, 2018
wait new torrents 25 sec

May 26, 2018
Change systemd policy
CPUSchedulingPolicy=idle
Nice=19
```
</details>

#### Choose your destiny:

[Docker way](https://github.com/AndrewMarchukov/tracker-add#-docker-way)

[Systemd way](https://github.com/AndrewMarchukov/tracker-add#-systemd-way)

[Simple way (for routers)](https://github.com/AndrewMarchukov/tracker-add#-simple-way-for-routers)

## Installation and usage

#### * Docker way

Take image `docker pull andrewmhub/transmission-tracker-add`

```docker run --net=host -d -e HOSTPORT=localhost:9091 -e TR_AUTH=user:password --name=transmission-tracker-add andrewmhub/transmission-tracker-add:latest```

if you need another torrent tracker list then use docker run env 

`-e TORRENTLIST=https://raw.githubusercontent.com/user/trackerslist/master/mylist.txt` 

you have transmission daemon in docker then read [Docker Documentation Network](https://docs.docker.com/network/)


#### * Systemd way

Download script and make it executable:

Edit settings.json for transmission set rpc-enabled, rpc-username and rpc-password

```
wget --no-check-certificate -O /opt/bin/add-trackers-auto.sh https://raw.githubusercontent.com/AndrewMarchukov/tracker-add/master/tracker-add-auto.sh
wget --no-check-certificate -O /etc/systemd/system/transmission-tracker-add.service https://raw.githubusercontent.com/AndrewMarchukov/tracker-add/master/transmission-tracker-add.service
chmod +x /opt/bin/add-trackers-auto.sh
```
Set user and password in add-trackers-auto.sh
```
systemctl daemon-reload
systemctl enable transmission-tracker-add.service
systemctl start transmission-tracker-add.service

systemctl status transmission-tracker-add.service
● transmission-tracker-add.service - transmission tracker add
   Loaded: loaded (/etc/systemd/system/transmission-tracker-add.service; enabled; vendor preset: enabled)
   Active: active (running) since; 0 days ago
 Main PID: 19102 (add_trackers_au)
   CGroup: /system.slice/transmission-tracker-add.service
           ├─19102 /bin/bash /opt/bin/add-trackers-auto.sh
           └─31204 sleep 5
           
```

#### * Simple way (for routers)

Requirements: curl, transmission-remote

Download script and make it executable:

Edit settings for transmission set rpc-enabled, rpc-username and rpc-password

```
wget --no-check-certificate -O tracker-add-auto-router.sh https://raw.githubusercontent.com/AndrewMarchukov/tracker-add/master/tracker-add-auto-router.sh
chmod +x tracker-add-auto-router.sh
```
Set user and password in tracker-add-auto-router.sh

```
./tracker-add-auto-router.sh &
```
or
```
nohup ./tracker-add-auto-router.sh </dev/null >/var/log/tracker-add-auto.log 2>&1 &
```
or
```
screen -d -m -S tracker-add-auto path/to/tracker-add-auto-router.sh
```



### Extra manual script if you need
Set user and password in manual-tracker-add.sh

Run manual script to add some more trackers for active torrents:

```
/opt/bin # ./manual-tracker-add.sh
URL for https://hastebin.com/raw/bererufibu
Adding trackers for Film.HDRip.AVC.mkv...

######################################################################## 100,0%
* http://tracker.dutchtracking.nl:80/announce... failed.
* http://tracker.edoardocolombo.eu:6969/announce... failed.
* http://tracker.ex.ua:80/announce... failed.
* http://tracker.kicks-ass.net:80/announce... failed.
* http://tracker.mg64.net:6881/announce... done.
* http://tracker.tfile.me/announce... failed.
* http://tracker1.wasabii.com.tw:6969/announce... done.
* http://tracker2.itzmx.com:6961/announce... done.
```

Don't be confused with `failed` message. In most cases, it means tracker(s) already added and/or exists in current torrent.
