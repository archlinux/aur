IBController AUR
=================
Source and documentation for the
[IBController](https://github.com/ib-controller/ib-controller)
AUR package [ib-controller](https://aur.archlinux.org/packages/ib-controller/).
This allows you to control [Interactive Brokers](http://interactivebrokers.com/)
[Trader Workstation](http://www.interactivebrokers.com/en/pagemap/pagemap_APISolutions.php).

This package depends on Trader Workstation having been installed via AUR package
[ib-tws](https://aur.archlinux.org/packages/ib-tws/). It installs a custom build
of IBController and a headless
[systemd](http://en.wikipedia.org/wiki/Systemd) configuration that supports
multiple concurrent IB Gateway instances while addressing usual security needs.

To start IBController and the IB Gateway it manages, create an INI file in
``/etc/ibcontroller`` and use systemd commands such as:

```
sudo systemctl start ibcontroller@ininame.service
sudo systemctl enable ibcontroller@ininame.service
```

The aforementioned ``ininame`` should be the simple name of an ``/etc/ibcontroller``
INI file. For example, use ``ibcontroller@fdemo.service`` for the included
[financial advisor sample INI file](package/fdemo.ini),
or ``ibcontroller@edemo.service`` for the included
[individual user sample INI file](package/edemo.ini). Both sample INI files can
be used concurrently, as they bind to unique ports. Please refer to the
[IBController](https://github.com/ib-controller/ib-controller) documentation for
the meaning of individual INI configuration settings.

Please note future updates to this package may change the sample INI files to
reflect new configuration defaults. You should create your own
INI file(s) rather than editing one of the shipped INI files. Similarly the
systemd configuration file may be changed in future updates.

Monitoring
----------
If you'd like to monitor your IBController is running and IB API is available,
[Monit](http://mmonit.com/monit/) is recommended. It's easily installed with
``sudo pacman -S monit``. Edit the ``/etc/monitrc`` file and add lines like:

```
set daemon 60
set mailserver mail.someisp.com
set alert you@you.com not on { instance, action }

check process ib-api-fdemo matching 'xvfb.*java.*fdemo.ini'
  start program = "/usr/sbin/systemctl start ibcontroller@fdemo.service"
  stop program = "/usr/sbin/systemctl stop ibcontroller@fdemo.service"
  if failed host 127.0.0.1 port 4002
    send "63\0x0071\0x001\0x005556\0x00" # clientVer\startAPI\startApiVer\5556
    expect "[0-9]{2,}"                   # serverVer reply
    send "49\0x001\0x00"                 # reqCurrTime\reqCurrTimeVer
    expect "49"                          # serverTime reply
  then restart
```

In the above:

* The ``daemon`` statement causes service monitoring every 60 seconds.
* The ``matching`` regular expression detects the ``fdemo.ini`` IBController
  process. Monit will then report additional  statistics in the Monit interface
  (eg CPU/RAM use) plus detect if the process is not running.
* The ``if failed host`` check on port ``4002`` performs an IB API connection
  handshake and requests the server time. This offers confidence IB API is
  running.
* The ``restart`` directive will both restart the service and send an email if
  there is any issue detected.

Don't forget you'll need to start Monit after editing the ``/etc/monitrc``:

```
sudo systemctl start monit
sudo systemctl enable monit
```

You can use [http://localhost:2812/](http://localhost:2812/) (default username
``admin``, password ``monit``) to access the Monit GUI.

Security
--------
Always ensure the ``/etc/ibcontroller`` INI files are only readable by ``root``,
as they contain your IB credentials. If you require additional credential safety
you may like to consider the IBController ``PasswordEncrypted`` option, however
it is easily decrypted and therefore not used in the sample files.

There is no mechanism to use IB hardware security tokens with the systemd
configuration. This is due to the systemd configuration using a virtual
framebuffer, so there is no mechanism by which hardware challenges can be
presented. If you have a hardware token, you can disable it for trading system
access via IB Account Management. Alternately you may like to create a new user
account under your IB account which has trading access but no hardware token.

Only 127.0.0.1 is trusted by the resulting IB Gateway instance. Port forwarding
(eg iptables, SSH tunneling) is suggested if other IP addresses are required.

Build and Test
--------------
If you'd like to try out changes to the package, these commands offer a start:

````
rm -rf pkg src *.xz *.zip && makepkg -f
namcap -m *.xz
sudo pacman -U *.xz
sudo systemctl daemon-reload
sudo systemctl start ibcontroller@fdemo.service
sudo systemctl status ibcontroller@fdemo.service
sudo systemctl stop ibcontroller@fdemo.service
mksrcinfo
git add
git push
````
