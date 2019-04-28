IBController AUR
=================
Source and documentation for the
[IBC](https://github.com/IbcAlpha/IBC)
AUR package [ibc](https://aur.archlinux.org/packages/ibc/).
This allows you to control [Interactive Brokers](http://interactivebrokers.com/)
[Trader Workstation](http://www.interactivebrokers.com/en/pagemap/pagemap_APISolutions.php).

This package depends on Trader Workstation having been installed via AUR package
[ib-tws](https://aur.archlinux.org/packages/ib-tws/). It installs a custom build
of IBController and a headless
[systemd](http://en.wikipedia.org/wiki/Systemd) configuration that supports
multiple concurrent IB Gateway instances while addressing usual security needs.

To start IBC and the IB Gateway it manages, create an INI file in
``/etc/ibc`` and use systemd commands such as:

```
sudo systemctl start ibc@ininame.service
sudo systemctl enable ibc@ininame.service
```

The aforementioned ``ininame`` should be the simple name of an ``/etc/ibc``
INI file. For example, use ``ibc@fdemo.service`` for the included
[financial advisor sample INI file](package/fdemo.ini),
or ``ibc@edemo.service`` for the included
[individual user sample INI file](package/edemo.ini). Both sample INI files can
be used concurrently, as they bind to unique ports. Please refer to the
[Ibc](https://github.com/IbcAlpha/IBC) documentation for
the meaning of individual INI configuration settings.

Please note future updates to this package may change the sample INI files to
reflect new configuration defaults. You should create your own
INI file(s) rather than editing one of the shipped INI files. Similarly the
systemd configuration file may be changed in future updates.

Security
--------
Always ensure the ``/etc/ibc`` INI files are only readable by ``root``,
as they contain your IB credentials.

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
rm -rf pkg src *.xz *.zip
makepkg -f
sudo pacman -U *.xz
sudo systemctl daemon-reload
sudo systemctl start ibc@fdemo.service
sudo systemctl status ibc@fdemo.service
sudo systemctl stop ibc@fdemo.service
````
