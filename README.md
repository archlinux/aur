# pia-tools

## Description

OpenVPN hook for privateinternetaccess.com to automate port forwarding, dynamically add a firewall rule, starting/stopping transmission when connected/disconnected

## TODO

* ~~Ship a ready-to-go OpenVPN wrapper service for systemd~~
* Get rid of ~~cURL and rename~~ (and sudo?) dependencies
* Modularity
* ~~Automate the [post-installation](#post-installation)~~
* Better error handling

## Dependencies

* curl
* dnsutils (nslookup)
* openvpn
* sed
* sudo
* systemd (**pseudo-optional - required for service start/stopping**)
* transmission-cli
* ufw

## Installation

### ArchLinux

```bash
mkdir /tmp/pia-tools; cd !$
curl -O https://raw.githubusercontent.com/pschmitt/pia-tools/master/{PKGBUILD,pia-tools.install}
makepkg -si
```

### Other distros

```bash
curl https://raw.githubusercontent.com/pschmitt/pia-tools/master/pia-tools > /usr/bin/pia-tools
```

#### MANPAGE

If you also want to have the MANPAGE:

```bash
curl https://raw.githubusercontent.com/pschmitt/pia-tools/master/pia-tools.groff | gzip -c - > $MAN_PATH/pia-tools.1.gz
```

**Note**: `$MANPATH` may not be defined, so you'll have to find out where to put the obtained file. On ArchLinux, this would be `/usr/share/man/man1/`

#### Systemd service file

```bash
curl https://raw.githubusercontent.com/pschmitt/pia-tools/master/pia@.service > /usr/lib/systemd/system/pia@.service
```

## Post installation

First I recommend to create `/etc/openvpn/pia` and the *required* config files:

```bash
mkdir -p /etc/openvpn/pia

# Feel free to edit the up/down parameters
cat <<EOM > /etc/openvpn/pia/pia_common
auth-user-pass passwd
script-security 2
up "/usr/bin/pia-tools -g"
down "/usr/bin/pia-tools --restore-dns"
EOM

# Start interactive setup
pia-tools --setup
```

The setup will store your credentials in `/etc/openvpn/pia/passwd`, download the config files from PIA and append `/etc/openvpn/pia/pia_common` to all of them.

In order to download the config files again run `pia-tools --update`

## Go! Go! GOOOOO!

```bash
systemctl start pia@Sweden
```

## Sample config file

Path: `/etc/pia-tools.conf`

```
PIA_CONFIG_DIR='/etc/openvpn/pia'
PIA_CONFIG_URL='https://www.privateinternetaccess.com/openvpn/openvpn.zip'
PIA_COMMON_CONFIG="$PIA_CONFIG_DIR/pia_common"
PIA_SERVERS_FILE="$PIA_CONFIG_DIR/piaservers"
PIA_SERVERS_IP_FILE="$PIA_CONFIG_DIR/piaserverips"
PIA_PASSWD_FILE="$PIA_CONFIG_DIR/passwd"
PIA_CLIENT_ID_FILE="$PIA_CONFIG_DIR/clientid"
TRANSMISSION_SETTINGS_FILE='/home/dl/.config/transmission-daemon/settings.json'
PIA_OPEN_PORT_FILE="$PIA_CONFIG_DIR/open_port"
VIRT_NET_DEV='tun0'
```

## Read more

If you installed the [MANPAGE](#manpage):

```bash
man pia-tools
```
