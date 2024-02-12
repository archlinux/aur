# mkinitcpio-tailscale

Provide a [mkinitcpio][1] hook to connect to a [Tailscale][2] network at boot, from within
the initramfs also known as the early userspace environment, just before handing over 
the control to the final rootfs.

This hook is extremely handy for remote unlocking systems with an encrypted root filesystem.
Read the Archlinux Wiki on how to configure mkinitcpio to [decrypt the rootfs on boot][3] and
how to add a ssh server to [remotely unlock it][4].

[1]: https://wiki.archlinux.org/title/Mkinitcpio
[2]: https://tailscale.com
[3]: https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2
[4]: https://wiki.archlinux.org/title/Dm-crypt/Specialties#Remote_unlocking_of_root_(or_other)_partition

Combine that with Tailscale and you get a secure VPN to access your locked server from anywhere,
without having to open a firewall hole to ssh from outside your home.

## Installation

Install [mkinitcpio-tailscale](https://aur.archlinux.org/packages/mkinitcpio-tailscale) package from AUR using your preferred helper, i.e.:

```
yay -S mkinitcpio-tailscale
```

## Configure

Run `setup-initcpio-tailscale` and follow the instructions. It will register a tailscale node with a hostname derived from the host system,
let say the host is named `homeserver`, the tailscale node will be registered as `homeserver-initrd`; that makes it easier 
to later identify the node in Tailscale panel.

Edit /etc/mkinitcpio.conf and add `tailscale` to HOOKS array.

For systemd based initramfs, the insertion order of the `tailscale` hook doesn't matter as long as it is after `systemd` hook itself.

For busybox based initramfs, it is recommended to place it after any network related hook and before any blocking hook like `encrypt` or `encryptssh`

### Tailscale SSH server

The Tailscale daemon can run a builtin SSH server, if enabled, installing _dropbear_ or _tinyssh_ isn't required to access the node remotely.

To enable it pass `--ssh` option like in: `setup-initcpio-tailscale -- --ssh`

The main difference of the builtin SSH server to something like _dropbear_ or _tinyssh_ is that the former is only accessible over the tailnet,
the node won't respond to local connections unless the client is also connected to the tailscale network. It is a good thing though. 

## Security Considerations

The *Tailscale node key* will be stored in plain text inside the initramfs. Even if the root filesystem is encrypted, remember that the initramfs isn't.
Someone with physical access to the node could steal the tailscale keys and attempt to log into the tailscale network impersonating the node the keys were created for.

To minimize the attack surface, we can limit the initramfs tailscale node to only accept incoming connections by addding the 
following [Tailscale ACL](https://login.tailscale.com/admin/acls) and tag clients, servers and initrd nodes accordinglly
using the [Tailscale Machines](https://login.tailscale.com/admin/machines) panel.


```json
{
	"tagOwners": {
		"tag:initrd": ["autogroup:admin"],
		"tag:client": ["autogroup:admin"],
		"tag:server": ["autogroup:admin"],
    },

	"acls": [
		{"action": "accept", "src": ["tag:client"], "dst": ["*:*"]},
		{"action": "accept", "src": ["tag:server"], "dst": ["tag:server:*"]},
	],
}
```

Even if the attacker manages to get the node keys, it won't be able to escalate into your tailscale network and all other nodes will be unreacheable.


## Prior work and big thanks

* [@tavianator][gh1] and his early work on https://gist.github.com/tavianator/6b00355cedae0b2ceb338e43ce8e5c1a
* [@karepker][gh2] for a very detailed rootfs unlocking on [Raspeberry Pi + Archlinux](https://karepker.com/raspberry-pi/)
* [@classabbyamp][gh3] for a similar [mkinitcpio hook](https://github.com/classabbyamp/mkinitcpio-tailscale) for non systemd initramfs on Void Linux. Also for the tailscale ACLs idea!
* [@wolegis][gh4] for [mkinitcpio-systemd-extras](https://github.com/wolegis/mkinitcpio-systemd-extras/) that served as major inspiration for my systemd hook

[gh1]: https://github.com/tavianator
[gh2]: https://github.com/karepker
[gh3]: https://github.com/classabbyamp
[gh4]: https://github.com/wolegis
