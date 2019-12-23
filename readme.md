craftbukkit+spigot package for archlinux
========================================

Quick start:
```
sudo systemctl start spigot
# Let's see if it started successfully
systemctl status spigot
# Nope, failed...
tail /srv/craftbukkit/logs/latest.log
# Oh! We need to agree to an EULA!
# (Set eula=true)
sudo nano -w /srv/craftbukkit/eula.txt
sudo systemctl start spigot
# If you like what you see, you can enable it to start on boot
sudo systemctl enable spigot
```

To let your user modify configuration and use the craftbukkit-mcrcon command,
add your user to the "craftbukkit" group
```
sudo usermod -a -G craftbukkit "$USER"
# Now log out and back in (yes... a real log out)
```

If you install *mcrcon*, you can use it via the `craftbukkit-mcrcon` wrapper to
issue commands on the server.
```
craftbukkit-mcrcon icanhasbukkit
```

*mcrcon* also powers `craftbukkit-save`, which temporarily disables minecraft
saving to disk which allows making a backup "snapshot" of game state. See
`/usr/share/doc/craftbukkit-spigot/backup.sh` for a simple backup script.

What does this package do?
--------------------------

This package installs 2 popular Minecraft servers and their tools:
vanilla *minecraft* and *spigot*. It also provides *craftbukkit*, which is
provided for testing bugs to provide a more helpful bug report with Spigot.

How to use it?
--------------
For historical reasons, `/srv/craftbukkit/` is the default directory used to
run Minecraft and hold the server configuration, maps, and logs. Users that
belong to the group `craftbukkit` can manage the server.

Once you have run one of the servers for the first time, review and
modify the content of `server.properties` to configure Minecraft to your
liking. See [spigot's documentation](https://www.spigotmc.org/wiki/spigot-configuration-server-properties/)
for details.

### Starting server ###
Depending on which server you want to run, use:
```
sudo systemctl start spigot
```
or
```
sudo systemctl start minecraft
```

NOTE: Spigot, and Craftbukkit, and vanilla Minecraft can't be run
simultaneously.

If you want the server to start automatically when the server boots up, use:
```
sudo systemctl enable spigot
```
or
```
sudo systemctl enable minecraft
```

### Stopping the server ###
Depending on which server you are running, use:
```
sudo systemctl stop spigot
```
```
sudo systemctl stop minecraft
```
Players that are in game when the stop command is being issued will see a 10
sec countdown in the chat before shutdown.

### Making backups ###
A simple backup script is provided that does not take any argument. Just run
`/usr/share/craftbukkit-spigot/backup.sh`. The script can be considered an
example, so feel free to copy it and modify it for your own backup preferences.

The script temporarily suspends the automatic saving of world chunks on the
running server and makes a compressed copy of the directories `world`,
`world_nether` and `world_the_end` into the `/srv/craftbukkit/backup` folder.
The resulting `.tar.bzip2` file is named with a date/time stamp.

To restore a specific backup you first need to stop the server. Then change the
current working directory to where the server resides and untar the backup
image. For example:
```
cd /srv/craftbukkit
tar -xjf 201503211347.tar.bzip2
```
Once it is done you can restart the server.

Additional notes
----------------

This package makes it easy to communicate with the server instance using
*mcrcon*. Install the mcrcon package and then all valid bukkit commands can be
sent to the running server using `craftbukkit-mcrcon`. The syntax is simple:
```
craftbukkit-mcrcon "<command>"
```
For example:
```
craftbukkit-mcrcon "say Hello World!"
```
Will display the text `[rcon] Hello World!` in the in-game chat.

### Shutting down server without mcrcon ###
When shutting down your server without having mcrcon configured or installed,
you may notice that the output logs are missing the last shutdown log lines.
This is a java.util.logging issue and only impacts the logs themselves, not
other data.

If this bothers you, install mcrcon which will be used to shut down the server
in a different manner that does not truncate the final lines of log output.

### Adjusting max memory and other JVM options ###
You should review the amount of memory that is allocated to the heap for this
server and make sure that it is in line with the available memory on your
system. By default the *maximum heap memory size* is set to 1 gigabyte with the
`-Xmx1G` java command line option. To change it, run `sudo systemctl edit
spigot` and set the `JAVA_OPTS` environment variable:

```
[Service]
Environment=JAVA_OPTS=-Xmx2G
```

You can also set other Java options, for example:
```
[Service]
Environment="JAVA_OPTS=-Xmx2G -Xms512M"
```

### Using a directory different than /srv/craftbukkit ###
If you want to use a different directory, use `systemctl edit` to change the
`WorkingDirectory` of the service. For example, to change spigot's directory:

```
sudo mkdir /srv/spigot
sudo chown craftbukkit:craftbukkit /srv/spigot
sudo cp /srv/craftbukkit/eula.txt /srv/spigot/eula.txt
sudo systemctl edit spigot
```

And then write these contents into the editor systemctl opens:
```
[Service]
WorkingDirectory=/srv/spigot
```

Alternatively, see the next section on running multiple servers. Setting the
directory is more straight-forward with multiple servers, but then requires all
interaction with the server to specify the directory. Thus the approach
discussed in this section is generally preferred.

### Running multiple servers ###
Templated services are provided that allow running multiple servers
simultaneously: minecraft@, craftbukkit@, and spigot@. The instance name should
be the server directory to use, encoded as a systemd unit name path as
performed by `systemd-escape -p`. Each running server must use a different
directory.

With multiple servers, you will need to begin passing the "-d" argument to
craftbukkit-mcrcon and craftbukkit-save and specify the instance name when
using systemctl.

For example, to create a new spigot server:
```
$ sudo mkdir /srv/spigot
$ sudo chown craftbukkit:craftbukkit /srv/spigot
$ sudo cp /srv/craftbukkit/eula.txt /srv/spigot/eula.txt
$ systemd-escape -p /srv/spigot
srv-spigot
$ sudo systemctl enable --now spigot@srv-spigot
$ craftbukkit-mcrcon -d /srv/spigot icanhasbukkit
```
