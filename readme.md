craftbukkit+spigot package for archlinux
========================================

What does this package do?
--------------------------

This package installs 2 popular Minecraft servers and their tools: *cracftbukkit* and *Spigot*. They can be used alternatively.

### Craftbukkit ###
Craftbukkit is a Minecraft server that implements the *Bukkit* API. Bukkit is a free, open-source, software project that provides the means to extend the popular Minecraft multiplayer server with plugins. The collection of plugins is huge and many of them are available in AUR.

* [Bukkit Home Page](http://bukkit.org/)
* [List of available Bukkit plugins](http://www.curse.com/bukkit-plugins/minecraft)

### Spigot ###
Spigot is just a modification of CraftBukkit, made more efficient. It is a huge collection of various tweaks to help increase performance, and make it more flexible as a server. Fortunately for you, this also means most CraftBukkit plugins are reverse-compatible with Spigot! Not only that, this project may also be the source of zero-day patches designed to fix critical issues before they are applied to the mainline CraftBukkit.

* [Spigot Home Page](http://www.spigotmc.org/)

**So you should try to run Spigot first and if you encounter compatibility issues with your plugins, you can fall back to using Craftbukkit**.

How to use it?
--------------
The server files are installed under `/srv/cracftbukkit/`. Users that belong to the group `craftbukkit` can manage the server.

Once you have run one of the servers for the first time (see below), review and modify the content of `server.properties` to configure Minecraft to your liking.

### Starting server ###
Depending on which server you want to run, use:
```
sudo systemctl start spigot
```
or
```
sudo systemctl start cracftbukkit
```

NOTE: Spigot and Craftbukkit can't be run simultaneously. if you try start one server while the other is already running, the one that is running will be shut down before the other one starts.

if you want the server to start automatically when the server boots up, use:
```
sudo systemctl enable spigot
```
or
```
sudo systemctl enable cracftbukkit
```

### Stopping the server ###
Depending on which server you are running, use:
```
sudo systemctl stop spigot
```
```
sudo systemctl stop cracftbukkit
```
Players that are in game when the stop command is being issued will see a 10 sec countdown in the chat before shutdown.

### Making backups ###
A simple backup script is provided that does not take any argument. Just run `./backup.sh`.

The script temporarily suspends the automatic saving of world chunks on the running server and makes a compressed copy of the directories `world`, `world_nether` and `world_the_end` into the `/srv/craftbukkit/backup` folder. The resulting `.tar.bzip2` file is named with a date/time stamp.

To restore a specific backup you first need to stop the server. Then change the current working directory to where the server resides and untar the backup image. For example:
```
cd /srv/craftbukkit
tar -xjf 201503211347.tar.bzip2
```
Once it is done you can restart the server.

Additional notes
----------------
This package is generated using Spigot build tools. These tools fetch the official Minecraft server, patches and modification files from their git repositories and assemble the modified servers on your machine locally. As no modified Minecraft server is being distributed, these build tools and this package are therefore not subject to the DMCA notice that has hit the craftbukkit "binary" packages.

This package creates a daemon and communicates with the server instance using *mcrcon*. All valid bukkit commands can be sent to the running server using the provided bash script `send_command.sh`. The syntax is simple:
```
./send_command.sh "<command>"
```
For example:
```
./send_command.sh "say Hello World!"
```
Will display the text `[rcon] Hello World!` in the in-game chat.

You should review the amount of memory that is allocated to the heap for this server and make sure that it is in line with the available memory on your system. By default the *maximum heap memory size* is set to 1 gigabyte with the `-Xmx1G` java command line option. To change it, edit `start_server.sh` and modify the java command line option. E.g. you can set it to 512 megabytes with `-Xmx512M`.

Finally, If nothing else works, a vanilla minecraft server is also provided as part of the package. It is managed in the same way as descibed above. The service is called `minecraft` and it can be started with:
```
sudo systemctl start minecraft
```
