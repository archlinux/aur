
<!-- Public changelog source from release version: -->
<!-- https://github.com/NordSecurity/nordvpn-linux/releases/tag/3.16.3 -->
---

* We improved how command line parameters are handled to avoid connection errors caused by typing in all caps.
* Thanks to the community of our eagle-eyed contributors, we’ve removed a bunch of typos.
* Arguments in our help texts now follow the POSIX.1-2017 standard.
* We implemented a security upgrade for the connections over the OpenVPN protocol.
* Peers without an IP address will now be skipped when managing Meshnet configuration.
* We fixed a bug that prevented sharing files over Meshnet.
