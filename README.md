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
[4]: https://wiki.archlinux.org/title/Dm-crypt/Specialties#systemd_based_initramfs_(built_with_mkinitcpio)

Combined that with running the Tailscale service and you get an very secure VPN access from anywhere
without having to open the ssh port to the world.

## Installation

```
yay -S mkinitcpio-tailscale
```

## Configure

Edit /etc/mkinitcpio.conf and add `sd-tailscale` to HOOKS array, i.e:

> HOOKS=(base **systemd** keyboard autodetect keymap modconf sd-vconsole *sd-network* *sd-resolve* *sd-tinyssh* **sd-tailscale** block sd-encrypt filesystems fsck)

**NOTE**: In above HOOKS line there are three hooks provided by mkinitcpio-systemd-extras package: `sd-network`, `sd-resolve` and `sd-tinyssh`.
          Even if you can get the early boot network configuration working without them, it is much simpler this way.

*IMPORTANT*: This hook doesn't work with mkinitcpio configurations that uses `udev` hook instead of `systemd`

Once the hook is configured, run `setup-initcpio-tailscale` (as a normal user) and follow the instructions to register the node to your tailscale account.
The script will register a tailscale node with a hostname derived from the host system, let say the host is named `homeserver`, the
tailscale node will be registered as `homeserver-initrd`; that makes it easier to identify the node in Tailscale panel.

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
