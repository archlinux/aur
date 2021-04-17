# Hummingbird for Linux and macOS

#### AirVPN's free and open source OpenVPN 3 client based on AirVPN's OpenVPN 3 library fork

### Version 1.1.1 - Release date 7 January 2021


**Main features:**

* Lightweight and stand alone binary
* No heavy framework required, no GUI
* Tiny RAM footprint
* Lightning fast
* Based on [OpenVPN 3 library fork by AirVPN](https://github.com/AirVPN/openvpn3-airvpn)
  with tons of critical bug fixes from the main branch, new ciphers support and
  never seen before features
* ChaCha20-Poly1305 cipher support on both Control and Data Channel providing
  great performance boost on ARM, Raspberry PI and any Linux-based platform not
  supporting AES-NI. *Note:* ChaCha20 support for Android had been already
  implemented in [our free and open source Eddie Android edition](https://airvpn.org/forums/topic/44201-eddie-android-edition-24-released-chacha20-support/)
* robust leaks prevention through Network Lock based either on iptables, nftables
  or pf through automatic detection
* proper handling of DNS push by VPN servers, working with resolv.conf as well as
  any operational mode of systemd-resolved additional features


## Contents

* [How to install AirVPN Hummingbird client for Linux - Raspberry and macOS](#how-to-install-airvpn-hummingbird-client-for-linux-raspberry-and-macos)
  * [Requirements](#requirements)
  * [Linux i686 Installation](#linux-i686-installation)
  * [Linux x86-64 Installation](#linux-x86-64-installation)
  * [Raspberry - Raspbian - Linux ARM 32 bit Installation](#raspberry-raspbian-linux-arm-32-bit-installation)
  * [Raspberry - Linux ARM 64 bit Installation](#raspberry-linux-arm-64-bit-installation)
  * [Note about SELinux](#note-about-selinux)
  * [macOS Installation](#macos-installation)
    * [Installing the signed and notarized version](#installing-the-signed-and-notarized-version)
    * [Installing the plain version](#installing-the-plain-version)
  * [Note on Checksum Files](#note-on-checksum-files)
* [Running the Hummingbird Client](#running-the-hummingbird-client)
  * [Start a connection](#start-a-connection)
  * [Stop a connection](#stop-a-connection)
  * [Start a connection with a specific cipher](#start-a-connection-with-a-specific-cipher)
  * [Disable the network filter and lock](#disable-the-network-filter-and-lock)
  * [Ignore the DNS servers pushed by the VPN server](#ignore-the-dns-servers-pushed-by-the-vpn-server)
* [Network Filter and Lock](#network-filter-and-lock)
* [DNS Management in Linux](#dns-management-in-linux)
* [DNS Management in macOS](#dns-management-in-macos)
* [Recover Your Network Settings](#recover-your-network-settings)
* [Building Hummingbird from Sources](#building-hummingbird-from-sources)
  * [Build Linux Dynamic Binary](#build-linux-dynamic-binary)
  * [Build Linux - ARM and macOS Static Binary](#build-linux-arm-and-macos-static-binary)


-------------------------------------------------------------------------------


## How to install AirVPN Hummingbird client for Linux - Raspberry and macOS

Hummingbird is distributed both in binary and source code forms. Both the binary
version and the complete source code is available in the official
[gitlab repository](https://gitlab.com/AirVPN/hummingbird). For more
information, feedback and latest news, please refer to
[AirVPN forum](https://airvpn.org/forums/) and related threads


### Requirements

**Linux**

* i686 (32 bit), x86-64 (64 bit), ARM 32 or ARM 64 bit CPU
* A reasonably recent Linux distribution
* tar
* sha512sum (optional)
* ldd (optional)

**Raspberry**

* Linux Raspbian distribution or Linux ARM 64 bit distribution
* tar
* sha512sum (optional)
* ldd (optional)


**macOS**

* macOS Mojave or higher version
* tar for plain version, zip for notarized version
* shasum (optional)
* otool (optional)


## Linux i686 Installation

* Download [hummingbird-linux-i686-1.1.0.tar.gz](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-i686-1.1.0.tar.gz)
* (optional) Download [hummingbird-linux-i686-1.1.0.tar.gz.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-i686-1.1.0.tar.gz.sha512)
  This file is required to check the integrity of the above tar archive. It is
  not mandatory but it is strongly advised to download this file and check the
  tar archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the tar archive by issuing this command:
  `sha512sum --check hummingbird-linux-i686-1.1.0.tar.gz.sha512`
* [optional] Make sure the command responds with `hummingbird-linux-i686-1.1.0.tar.gz: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the tar archive by issuing this command on your terminal window:
  `tar xvf hummingbird-linux-i686-1.1.0.tar.gz`
* A new directory will be created: `hummingbird-linux-i686-1.1.0`
* Move into this new directory with command `cd hummingbird-linux-i686-1.1.0`
* [optional] Check the integrity of binary file `hummingbird`. Issue this command
  from your terminal window: `sha512sum --check hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `ldd hummingbird` and make sure all the required dynamic libraries are
   available. No line of the output must contain "not found"
* The Linux client is now ready to be used and possibly copied to a different
  directory of your system, such as `/usr/bin` or `/usr/local/bin`

**Please note hummingbird client needs root privileges to run. Your user must therefore
be included in your system's "sudoers" (depending on specific Linux
distribution)**


## Linux x86-64 Installation

* Download [hummingbird-linux-x86_64-1.1.0.tar.gz](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-x86_64-1.1.0.tar.gz)
* (optional) Download [hummingbird-linux-x86_64-1.1.0.tar.gz.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-x86_64-1.1.0.tar.gz.sha512)
  This file is required to check the integrity of the above tar archive. It is
  not mandatory but it is strongly advised to download this file and check the
  tar archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the tar archive by issuing this command:
  `sha512sum --check hummingbird-linux-x86_64-1.1.0.tar.gz.sha512`
* [optional] Make sure the command responds with `hummingbird-linux-x86_64-1.1.0.tar.gz: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the tar archive by issuing this command on your terminal window:
  `tar xvf hummingbird-linux-x86_64-1.1.0.tar.gz`
* A new directory will be created: `hummingbird-linux-x86_64-1.1.0`
* Move into this new directory with command `cd hummingbird-linux-x86_64-1.1.0`
* [optional] Check the integrity of binary file `hummingbird`. Issue this command
  from your terminal window: `sha512sum --check hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `ldd hummingbird` and make sure all the required dynamic libraries are
   available. No line of the output must contain "not found"
* The Linux client is now ready to be used and possibly copied to a different
  directory of your system, such as `/usr/bin` or `/usr/local/bin`

**Please note hummingbird client needs root privileges to run. Your user must therefore
be included in your system's "sudoers" (depending on specific Linux
distribution)**


## Raspberry - Raspbian - Linux ARM 32 bit Installation

* Download [hummingbird-armv7l-1.1.0.tar.gz](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-armv7l-1.1.0.tar.gz)
* [optional] Download [hummingbird-armv7l-1.1.0.tar.gz.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-armv7l-1.1.0.tar.gz.sha512)
  This file is required to check the integrity of the above tar archive. It is
  not mandatory but it is strongly advised to download this file and check the
  tar archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the tar archive by issuing this command:
  `sha512sum --check hummingbird-armv7l-1.1.0.tar.gz.sha512`
* [optional] Make sure the command responds with `hummingbird-armv7l-1.1.0.tar.gz: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the tar archive by issuing this command on your terminal window:
  `tar xvf hummingbird-armv7l-1.1.0.tar.gz`
* A new directory will be created: `hummingbird-armv7l-1.1.0`'
* Move into this new directory with command `cd hummingbird-armv7l-1.1.0`
* [optional] Check the integrity of the binary file `hummingbird`. Issue this
  command from your terminal window: `sha512sum --check hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `ldd hummingbird` and make sure all the required dynamic libraries are
  available. No line of the output must contain "not found"
* the Raspberry/Raspbian/ARM32 client is now ready to be used and possibly
  copied to a different directory of your system, such as `/usr/bin` or
  `/usr/local/bin`

**Please note hummingbird needs root privileges to run. Your user must therefore be
included in your system's "sudoers"**


## Raspberry - Linux ARM 64 bit Installation

* Download [hummingbird-aarch64-1.1.0.tar.gz](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-aarch64-1.1.0.tar.gz)
* [optional] Download [hummingbird-aarch64-1.1.0.tar.gz.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-linux-aarch64-1.1.0.tar.gz.sha512)
  This file is required to check the integrity of the above tar archive. It is
  not mandatory but it is strongly advised to download this file and check the
  tar archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the tar archive by issuing this command:
  `sha512sum --check hummingbird-aarch64-1.1.0.tar.gz.sha512`
* [optional] Make sure the command responds with "``hummingbird-aarch64-1.1.0.tar.gz: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the tar archive by issuing this command on your terminal window:
  `tar xvf hummingbird-aarch64-1.1.0.tar.gz`
* A new directory will be created: `hummingbird-aarch64-1.1.0`
* Move into this new directory with command `cd hummingbird-aarch64-1.1.0`
* [optional] Check the integrity of the binary file `hummingbird`. Issue this
  command from your terminal window: `sha512sum --check hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `ldd hummingbird` and make sure all the required dynamic libraries are
  available. No line of the output must contain "not found"
* The Raspberry/ARM64 client is now ready to be used and possibly copied to a
  different directory of your system, such as `/usr/bin` or `/usr/local/bin`

**Please note hummingbird needs root privileges to run. Your user must therefore be
included in your system's "sudoers"**


## Note about SELinux

In case your system has SELinux and Hummingbird is included in a systemd unit in order
to make it start at boot time, you should note SELinux will prevent nft to be called
from Hummingbird because access to stdin is forbidden by the default policy. In this
specific case, Hummingbird will be unable to enforce Network Lock rules via nft and
you need to create a specific SELinux exception in order to do that.


## macOS Installation

Hummingbird for macOS is distributed in two versions: signed/notarized and plain.
The distribution files are identified as follows:

* Signed and notarized version: hummingbird-macos-notarized-1.1.0.zip
* Plain version: hummingbird-macos-1.1.0.tar.gz

The difference is about how the package is seen by macOS security and it is
therefore up to the user to pick the distribution file suiting his or her needs
best. The signed/notarized version is compliant to macOS software security scheme
and runs "out-of-the-box", whereas the plain version needs to be explicitly
granted permission to run by the user in macOS security & privacy settings.
Please note both versions are the same and ensure the very same functionality
in connecting a VPN server, it is however up to the user to decide whether using
the signed and notarized version or not.

### Installing the signed and notarized version

* Download [hummingbird-macos-notarized-1.1.0.zip](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-macos-notarized-1.1.0.zip)
* [optional] Download [hummingbird-macos-notarized-1.1.0.zip.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-macos-notarized-1.1.0.zip.sha512)
  This file is required to check the integrity of the above zip archive. It is
  not mandatory but it is strongly advised to download this file and check the
  zip archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the zip archive by issuing this command:
  `shasum -a 512 -c hummingbird-macos-notarized-1.1.0.zip.sha512`
* [optional] Make sure the command responds with `hummingbird-macos-notarized-1.1.0.zip: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the zip archive by issuing this command on your terminal window:
  `unzip -x hummingbird-macos-notarized-1.1.0.zip`
* A new directory will be created: `hummingbird-macos-1.1.0`
* Move into this new directory by entering command `cd hummingbird-macos-1.1.0`
* [optional] Check the integrity of the binary file `hummingbird`. Issue this
  command from your terminal window: `shasum -a 512 -c hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `otool -L hummingbird` and make sure all the required dynamic libraries are
  available. No line of the output must contain "not found". **Please note
  `otool` is distributed with Xcode**
* the macOS client is now ready to be used and possibly copied to a different
  directory of your system, such as `/usr/bin` or `/usr/local/bin`

**Please note hummingbird needs root privileges to run. Also note the notarized
version has been signed with AirVPN di Paolo Brini Apple developer certificate
(ASC provider ID: A7P5AKGWFC)**

  
### Installing the plain version

* Download [hummingbird-macos-1.1.0.tar.gz](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-macos-1.1.0.tar.gz)
* [optional] Download [hummingbird-macos-1.1.0.tar.gz.sha512](https://gitlab.com/AirVPN/hummingbird/blob/master/binary/hummingbird-macos-1.1.0.tar.gz.sha512)
  This file is required to check the integrity of the above tar archive. It is
  not mandatory but it is strongly advised to download this file and check the
  tar archive integrity
* [optional] Open a terminal window
* [optional] Check the integrity of the tar archive by issuing this command:
  `shasum -a 512 -c hummingbird-macos-1.1.0.tar.gz.sha512`
* [optional] Make sure the command responds with `hummingbird-macos-1.1.0.tar.gz: OK`
* Change your current directory to a convenient place, such as your home
  directory. This can be done by issuing the command `cd ~`
* Extract the tar archive by issuing this command on your terminal window:
  `tar xvf hummingbird-macos-1.1.0.tar.gz`
* A new directory will be created: `hummingbird-macos-1.1.0`
* Move into this new directory by entering command `cd hummingbird-macos-1.1.0`
* [optional] Check the integrity of the binary file `hummingbird`. Issue this
  command from your terminal window: `shasum -a 512 -c hummingbird.sha512`
* [optional] Make sure the command responds with `hummingbird: OK`
* [optional] Check dynamic library availability. Issue the command
  `otool -L hummingbird` and make sure all the required dynamic libraries are
  available. No line of the output must contain "not found". **Please note
  `otool` is distributed with Xcode**
* the macOS client is now ready to be used and possibly copied to a different
  directory of your system, such as `/usr/bin` or `/usr/local/bin`

**Please note hummingbird needs root privileges to run.**


## Note on Checksum Files

We do strongly suggest you to check the integrity both of the distribution
`tar.gz` file and the `hummingbird` binary in order to make sure you are
installing a binary created and fully supported by AirVPN. Please read
[CHECKSUM.md](https://gitlab.com/AirVPN/hummingbird/blob/master/CHECKSUM.md) for
more information and to get the checksum codes created and guaranteed by AirVPN.


# Running the Hummingbird Client

Run `hummingbird` and display its help in order to become familiar with its
options. From your terminal window issue this command:

>`sudo ./hummingbird --help`

After having entered your root account password, `hummingbird` responds with:

>`Hummingbird - AirVPN OpenVPN 3 Client 1.1.1 - 7 January 2020`  
>  
>`usage: hummingbird [options] <config-file>`  
>`--help, -h            : show this help page`  
>`--version, -v         : show version info`  
>`--eval, -e            : evaluate profile only (standalone)`  
>`--username, -u        : username`  
>`--password, -p        : password`  
>`--response, -r        : static response`  
>`--dc, -D              : dynamic challenge/response cookie`  
>`--cipher, -C          : encrypt packets with specific cipher algorithm (alg)`  
>`--proto, -P           : protocol override (udp|tcp)`  
>`--server, -s          : server override`  
>`--port, -R            : port override`  
>`--tcp-queue-limit, -l : size of TCP packet queue (1-65535, default 8192)`  
>`--ncp-disable, -n     : disable negotiable crypto parameters`  
>`--network-lock, -N    : network filter and lock mode (on|iptables|nftables|pf|off, default on)`  
>`--gui-version, -E     : set custom gui version (text)`  
>`--ignore-dns-push, -i : ignore DNS push request and use system DNS settings`  
>`--ipv6, -6            : combined IPv4/IPv6 tunnel (yes|no|default)`  
>`--timeout, -t         : timeout`  
>`--compress, -c        : compression mode (yes|no|asym)`  
>`--pk-password, -z     : private key password`  
>`--tvm-override, -M    : tls-version-min override (disabled, default, tls_1_x)`  
>`--tcprof-override, -X : tls-cert-profile override (legacy, preferred, etc.)`  
>`--proxy-host, -y      : HTTP proxy hostname/IP`  
>`--proxy-port, -q      : HTTP proxy port`  
>`--proxy-username, -U  : HTTP proxy username`  
>`--proxy-password, -W  : HTTP proxy password`  
>`--proxy-basic, -b     : allow HTTP basic auth`  
>`--alt-proxy, -A       : enable alternative proxy module`  
>`--cache-password, -H  : cache password`  
>`--no-cert, -x         : disable client certificate`  
>`--def-keydir, -k      : default key direction ('bi', '0', or '1')`  
>`--ssl-debug           : SSL debug level`  
>`--auto-sess, -a       : request autologin session`  
>`--auth-retry, -Y      : retry connection on auth failure`  
>`--persist-tun, -j     : keep TUN interface open across reconnects`  
>`--peer-info, -I       : peer info key/value list in the form K1=V1,K2=V2,...`  
>`--gremlin, -G         : gremlin info (send_delay_ms, recv_delay_ms, send_drop_prob, recv_drop_prob)`  
>`--epki-ca             : simulate external PKI cert supporting intermediate/root certs`  
>`--epki-cert           : simulate external PKI cert`  
>`--epki-key            : simulate external PKI private key`  
>`--recover-network     : recover network settings after a crash or unexpected exit`  
>  
>`Open Source Project by AirVPN (https://airvpn.org)`  
>  
>`Linux and macOS design, development and coding by ProMIND`  
>  
>`Special thanks to the AirVPN community for the valuable help,`  
>`support, suggestions and testing.`  


Hummingbird needs a valid OpenVPN profile in order to connect to a server. You
can create an OpenVPN profile by using the config generator available at AirVPN
website in your account's [Client Area](https://airvpn.org/generator/)


#### Start a connection

>`sudo ./hummingbird your_openvpn_file.ovpn`


#### Stop a connection

Type `CTRL+C` in the terminal window where hummingbird is running. The client
will initiate the disconnection process and will restore your original network
settings according to your options.


#### Start a connection with a specific cipher

>`sudo ./hummingbird --ncp-disable --cipher CHACHA20-POLY1305 your_openvpn_file.ovpn`

**Please note**: in order to properly work, the server you are connecting to
must support the cipher specified with the `--cipher` option. If you wish to use
`CHACHA20-POLY1305` cipher, you can find AirVPN servers supporting it in [our
real time servers monitor](https://airvpn.org/status): they are marked in yellow
as "Experimental ChaCha20".


#### Disable the network filter and lock

>`sudo ./hummingbird --network-lock off your_openvpn_file.ovpn`


#### Ignore the DNS servers pushed by the VPN server

>`sudo ./hummingbird --ignore-dns-push your_openvpn_file.ovpn`


**Please note**: the above options can be combined together according to their
use and function.


## Network Filter and Lock

Hummingbird's network filter and lock natively uses `iptables`, `iptables-legacy`,
`nftables` and `pf` in order to provide a "best effort leak prevention". Hummingbird
will automatically detect and use the infrastructure available on your system.

You can also override this default behavior by manually selecting your preferred
firewall by using `--network-lock` option, which defaults to `on` and, in this
specific case, hummingbird will automatically detect and use the firewall installed
on your system by using this specific priority: `iptables-legacy`, `iptables`, 
`nftables` and finally `pf`.

In case you want to force the use of a specific firewall, you can do that by
specifying its name in the `--network-lock` option. For example, in case you want
to force hummingbird to use nftables, you can specify `--network-lock nftables`.
Please note the firewall must be properly installed on your system.

Also note in case both `iptables` and `iptables-legacy` are installed on your system,
hummingbird will use `iptables-legacy`.

**Note on nftables**: Nftables rules created and issued by Hummingbird follow the
specification and behavior of nftables version 0.9. In case you detect nftables
errors or it seems to not be working properly, please check nftables installed
on your system and make sure it is compatible with 0.9 specifications.

**Please note**: Linux services `firewalld` and `ufw` may interfere with the
hummingbird's network filter and lock and you are strongly advised to not issue
any firewall related command while the VPN connection is active.


## DNS Management in Linux

Hummingbird currently supports both `resolv.conf` and `systemd-resolved`
service. It is also aware of Network Manager, in case it is running. While the
client is running, you are strongly advised to not issue any resolved related
command (such as `resolvectl`) or change the `resolv.conf` file in order to make
sure the system properly uses DNS pushed by the VPN server. **Please note**: DNS
system settings are not changed in case the client has been started with
`--ignore-dns-push`. In this specific case, the connection will use your
system's DNS.

Furthermore, please note that if your network interfaces are managed by Network
Manager, DNS settings might be changed under peculiar circumstances during a VPN
connection, even when DNS push had been previously accepted.


## DNS Management in macOS

DNS setting and management is done through OpenVPN 3 native support


## Recover Your Network Settings

In case hummingbird crashes or it is killed by the user (i.e. ``kill -9 `pidof hummingbird` ``)
as well as in case of system reboot while the connection is active, the system
may keep and use some or all of the netwrok settings determined by the client,
therefore your network connection might not work as expected, every connection might
be refused and the system might seem to be "network locked". . To restore and recover
your system network, you can use the client with the `--recover-network` option.

>`sudo ./hummingbird --recover-network`

Please note in case of crash or unexpected exit, when you subsequently run
hummingbird it will warn you about the unexpected exit and will require you to
run it again with the `--recover-network` option. It will also refuse to start
any connection until the network has been properly restored and recovered.


# Building Hummingbird from Sources

In order to build `hummingbird` from sources, you need the following
dependencies:

* [OpenVPN 3 AirVPN fork](https://github.com/AirVPN/openvpn3-airvpn) (at least version 3.6.3)
* [asio](https://github.com/chriskohlhoff/asio)
* [OpenSSL](https://www.openssl.org/source/) or [mbedTLS](https://tls.mbed.org/download)
* [LZ4 library](https://github.com/lz4/lz4)
* [LZMA library](https://www.7-zip.org/sdk.html)
* [Linux] GCC development suite
* [macOS] clang/XCode development suite

Clone `hummingbird` repository into your computer:

>`git clone https://gitlab.com/AirVPN/hummingbird`

Move into the project's directory:

>`cd hummingbird`


## Build Linux Dynamic Binary

Edit `build.sh` script and set `INC_DIR`, `OPENVPN3` and `ASIO` variables
according to your system configuration

Run the build shell script:

>`sh build.sh`

The script will compile the project and create `hummingbird` binary in the
current directory.


## Build Linux - ARM and macOS Static Binary

Edit `build-static.sh` script and set `INC_DIR`, `OPENVPN3` and `ASIO` variables
according to your system configuration. Also set `STATIC_LIB_DIR` and
`SSL_LIB_DIR` according to your system architecture.

Run the build shell script:

>`sh build-static.sh`

The script will create a `hummingbird` static binary file according to your
system and will also create the associated distribution compressed tarball file
in the current directory. To install the binary in your system, please refer to
the installation instructions provided above.


***

Hummingbird is an open source project by [AirVPN](https://airvpn.org)

Linux and macOS design, development and coding by ProMIND

Special thanks to the AirVPN community for the valuable help, support,
suggestions and testing.

OpenVPN is Copyright (C) 2012-2017 OpenVPN Inc. All rights reserved.

Hummingbird is released and licensed under the
[GNU General Public License Version 3 (GPLv3)](https://gitlab.com/AirVPN/hummingbird/blob/master/LICENSE.md)

