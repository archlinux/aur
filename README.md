# mkinitcpio-tailscale

Reach an Arch Linux machine over [Tailscale][2] while it is still in early boot,
before the root filesystem has been unlocked.

A server with an encrypted root cannot finish booting on its own: it stops in
the initramfs and waits for a passphrase. When that machine is in another room,
or another country, a kernel update or a power cut leaves it sitting at that
prompt until somebody walks up to a keyboard.

This project provides a [mkinitcpio][1] hook that starts `tailscaled` inside the
initramfs, so the machine joins your tailnet before it mounts its root
filesystem. It registers as a device of its own, `homeserver-initrd` for a host
called `homeserver`, separate from the Tailscale node the booted system runs,
so you can SSH in, enter the passphrase, and let the boot carry on.

Because the path is Tailscale, nothing is exposed to the internet: no port
forwarding, no firewall holes, no SSH server for the rest of the world to knock
on. Who may reach the machine is decided by your tailnet ACLs and can be
narrowed to the initrd device alone; see [Security
considerations](#security-considerations), which also covers the trade-off of
keeping a node key in an unencrypted initramfs.

Tailscale's built-in SSH server is enabled by default, so no separate `dropbear`
or `tinyssh` is needed; see [Tailscale SSH server](#tailscale-ssh-server). Both
systemd- and busybox-based initramfs images are supported.

Unlocking the root filesystem is configured separately; the ArchWiki covers that
half:

- ArchWiki: [dm-crypt/Encrypting an entire system#Configuring mkinitcpio][3]
- ArchWiki: [Dm-crypt/Specialties#Remote unlocking of root (or other)
  partition][4]

## Installation

You can install [`mkinitcpio-tailscale`][aur] from the AUR:

```sh
yay -S mkinitcpio-tailscale
```

## Configure

### 1. Register the initrd node

```sh
setup-initcpio-tailscale
```

The helper starts a throwaway `tailscaled` and prints a URL and QR code to
authenticate with; it does not touch the Tailscale service your booted system
runs. No root needed up front: it escalates through `sudo` or `doas`,
whichever is present, in a single elevated step for the final writes under
`/etc/initcpio/tailscale/`, so you are asked for a password at most once. Any
extra arguments are passed straight through to `tailscale up`, so flags like
`--login-server=` work as usual.

It registers a node named after your host with an `-initrd` suffix (a machine
called `homeserver` appears as `homeserver-initrd`) with [Tailscale
SSH](#tailscale-ssh-server) turned on, and leaves the node key and the SSH host
keys in `/etc/initcpio/tailscale/`. Pass `--no-ssh` if you would rather run
`dropbear` or `tinyssh` in the image instead.

**Disable key expiry for that node** on the [Machines page of the Tailscale
admin console](https://console.tailscale.com/admin/machines). Node keys expire by default,
and an expired initrd node cannot reach your tailnet, which you would discover
while locked out of a machine that is waiting for its passphrase.

### 2. Give the initramfs a network

Nothing in mkinitcpio's stock hooks brings up networking, and `tailscaled`
cannot do anything without an address. Add one of these alongside this hook:

| initramfs | hook | package | configured by |
| --------- | ---- | ------- | ------------- |
| systemd   | `sd-network` | [`mkinitcpio-systemd-extras`][sdextras] (AUR) | `.network` files copied from `/etc/systemd/network` |
| busybox   | `net`        | [`mkinitcpio-nfs-utils`][nfsutils] (core)     | the `ip=` kernel parameter |
| busybox   | `netconf`    | [`mkinitcpio-extras`][extras] (AUR)           | the `ip=` kernel parameter |

Both busybox hooks take the same parameter, and either works with this hook;
they differ in what they can be told to do and where they come from:

```text
ip=192.168.1.50::192.168.1.1:255.255.255.0::eth0:none    # static, both hooks
ip=dhcp                                                  # netconf
```

`net` comes from the official repositories and needs no AUR build, which is
reason enough to prefer it when the machine has a fixed address. Its DHCP client
did not come up in testing, so reach for `netconf` if you need `ip=dhcp`. That
is also what the ArchWiki's remote-unlock guide uses, and
[`mkinitcpio-extras`][extras] is the maintained replacement for the retired
`mkinitcpio-netconf`, `mkinitcpio-dropbear` and `mkinitcpio-tinyssh`, so it is
the one to pick if you also want a `dropbear` or `tinyssh` alongside.

Use the kernel's device name (`eth0`) rather than the name the booted system
shows (`enp1s0`): the predictable names are not in effect this early. For
`sd-network`, match on a glob (`Name=en*`) instead of one fixed name, for the
same reason.

### 3. Add the hook

Edit `/etc/mkinitcpio.conf` and put `tailscale` after the network hook and
before whatever blocks waiting for a passphrase, be it `sd-encrypt`, `encrypt`
or `encryptssh`:

```text
# systemd-based
HOOKS=(base systemd autodetect microcode modconf kms keyboard sd-vconsole block sd-network tailscale sd-encrypt filesystems fsck)

# busybox-based
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block net tailscale encrypt filesystems fsck)
```

On a systemd-based initramfs `tailscale` **must** come after `systemd`. The hook
decides which kind of image it is building by looking for helpers that the
`systemd` hook defines, so listing it earlier silently produces the busybox
layout, which a systemd initramfs never runs, leaving you with an image that
builds cleanly and never connects.

### 4. Rebuild and check

```sh
sudo mkinitcpio -P
```

Before rebooting a machine you cannot walk up to, confirm the setup end to
end:

```sh
setup-initcpio-tailscale --check
```

It verifies, without changing anything, that the configuration files exist,
that `tailscale` sits correctly in `HOOKS=` (after `systemd`, after the
network hook, before the encrypt hook), that the built images actually contain
`tailscaled`, and (with `jq` installed and this machine on the tailnet) that
the initrd node's key is not about to expire. Then confirm the node is live:

```sh
tailscale status | grep -- -initrd    # from any other node on your tailnet
```

The image carries only what boots: `tailscaled`, not the `tailscale` CLI,
which nothing in early userspace executes and which costs about a quarter of
the image. To have it available for debugging from the emergency shell, set
`CLI="yes"` in `/etc/initcpio/tailscale/default.env` and rebuild.

From here on the image looks after itself: the package ships a pacman hook
that reruns `mkinitcpio -P` whenever the `tailscale` package is upgraded, since
the image carries its own copy of `tailscaled` that would otherwise stay at
the old version until the next kernel update. The hook does nothing on
machines where `tailscale` is not in `HOOKS=`.

### 5. Give yourself more than 90 seconds

On a systemd-based initramfs, whatever device `root=` names is a systemd device
unit, and systemd gives up on a device after 90 seconds
(`DefaultDeviceTimeoutSec`). That device only appears once the passphrase has
been entered, so the clock is running while you are still reaching for a
terminal. When it expires the mount jobs fail and the initramfs drops to
emergency mode; the passphrase prompt is still there, but answering it no longer
resumes the boot.

Whether it bites depends on how `root=` is written. `systemd-cryptsetup`
disables the timeout for the device it unlocks itself, so `root=/dev/mapper/root`
is safe. `root=UUID=<filesystem uuid>`, or an LVM volume on top of LUKS, is not:
that device unit is a different one, and it keeps the default. Removing the
limit costs nothing where it was not needed, so add it to your boot loader entry
either way:

```text
rootflags=x-systemd.device-timeout=0
```

This is a systemd-initramfs concern only; the busybox `encrypt` and
`encryptssh` hooks have no such timeout. And even when the timeout fires you
are not cut off: the boot test lets a systemd image run past it on purpose,
and the node stays online and still answers SSH in emergency mode, so you can
log in and finish the job by hand with
`systemctl start initrd-root-fs.target` after unlocking the device. A busybox
image is covered too, for a different reason: its init tears tailscaled down
before deciding the boot failed, so this hook starts it again on the way into
the emergency shell.

## Tailscale SSH server

Tailscale includes a built-in SSH server, and `setup-initcpio-tailscale` turns it
on unless told otherwise, so you need no `dropbear`, `tinyssh`, or other SSH
server inside the initramfs. Logging in is then:

```sh
ssh root@homeserver-initrd
```

The server only accepts connections from within your tailnet. The node won't
accept local connections unless the client is also part of your Tailscale
network, which reduces exposure compared to a traditional SSH server reachable
from everywhere.

The setup helper also generates OpenSSH host keys and stores them alongside
the node key, so the initramfs presents the same host key every time and your
client does not warn about a changed identity.

Works on systemd- and busybox-based initramfs alike, though the second needs a
hand: Tailscale's SSH server has to resolve the user you log in as, and of the
hooks mkinitcpio ships only `systemd` writes a user database into the image. On
a busybox-based initramfs this hook therefore writes a minimal one itself:
`root`, with `/bin/sh` as the shell, since that is what such an image actually
contains. Where a database already exists it is left untouched, so a
systemd-based image keeps the richer one mkinitcpio built. The same database
is what lets a `dropbear` or `tinyssh` in the image accept logins at all;
without one they greet the connection and then refuse it with
`Permission denied (publickey)`.

### Bringing your own SSH server

Turn Tailscale SSH off with:

```sh
setup-initcpio-tailscale --no-ssh
```

which also removes any host keys an earlier run left in
`/etc/initcpio/tailscale/`, so they stop being copied into new images.

**Run one SSH server, not two.** When Tailscale SSH is enabled, tailscaled
answers port 22 on the tailnet itself, so a dropbear or tinyssh in the same
initramfs never sees those connections; it still answers on other interfaces,
but not on the address you would actually reach it at. Either keep the default
and use Tailscale SSH, or register with `--no-ssh` and use your own daemon.

Two things your daemon needs. Inbound tailnet connections reach it through a
proxy that dials the same port on `127.0.0.1`, so it must listen on a wildcard
or loopback address (one bound to a specific interface address will never see
a connection); this hook brings `lo` up itself, since nothing else in a
busybox image would. And log in as root: everything in an initramfs is owned
by root, and `dropbear` refuses an `authorized_keys` it does not consider
owned by the user logging in, so root is the login that works. That is the
same reason the retired dropbear hooks used a `root_key`. If your daemon
really must bind an interface address, register with `--tun`: the initramfs
then runs on a kernel TUN device (`tailscale0`) and inbound connections arrive
through it the ordinary way.

The test suite covers all of this end to end: every scenario boots under QEMU
and is logged into from a second node on a throwaway tailnet, Tailscale SSH
and dropbear alike, over both network stacks, with the host key offered
checked against the expected one.

## Using headscale

Nothing here assumes Tailscale's hosted control plane. Register against your
own [headscale][hs] the way you would any node:

```sh
setup-initcpio-tailscale --login-server=https://headscale.example.net
```

or non-interactively with a pre-auth key:

```sh
setup-initcpio-tailscale --login-server=https://headscale.example.net \
    --authkey=file:node.key
```

One Tailscale-ism to translate: key expiry is headscale's to manage, not the
Tailscale admin console's, so the console URL in the setup output and in
`--check`'s advice does not apply to you. `headscale nodes list` shows each
node's expiry, and how it is set (and whether it applies at all) depends on
your headscale version and configuration; the probe in `--check` reads the
booted system's view of the tailnet and works against headscale all the same.

Tailscale SSH needs an `ssh` policy in headscale's ACLs before the node
accepts a session; the [Security considerations](#security-considerations)
example below is valid headscale policy. This is not a theoretical
combination: the test suite boots every scenario against a throwaway
headscale, so the path you are on is the one CI exercises.

## Void Linux

Only the packaging here is Arch's: the hook itself is distro-neutral, and Void
supports mkinitcpio as a first-class alternative to dracut, so this project
runs there too, busybox images only since Void has no systemd. Void's own
repos also carry a leaner hook under the same name. What transfers, what
does not, and how to install by hand is covered in
[docs/void-port.md](docs/void-port.md); CI builds and inspects images with
Void's mkinitcpio on every change.

## Security considerations

The Tailscale node key is stored in plaintext inside the initramfs. Initramfs is
usually not encrypted, so physical access to the machine could allow an attacker
to extract the node key and impersonate your initrd node on your tailnet.

Mitigations:

- Restrict what the initramfs node can access with Tailscale ACLs and tags. Tag
  the initrd node in the admin console and limit its permissions.
- Prefer granting the initrd node only the minimal access required (for example,
  only allow SSH from a narrow set of client tags).
- If a node is ever compromised, remove it from the admin console
  immediately and recreate the initramfs/node key.

Example ACL snippet to restrict initrd nodes (adapt to your tailnet):

```json
{
  "tagOwners": {
    "tag:initrd": ["autogroup:admin"],
    "tag:client": ["autogroup:admin"],
    "tag:server": ["autogroup:admin"]
  },

  "acls": [
    { "action": "accept", "src": ["tag:client"], "dst": ["*:*"] },
    { "action": "accept", "src": ["tag:server"], "dst": ["tag:server:*"] }
  ],

  "ssh": [
    {
      "action": "accept",
      "src": ["tag:client"],
      "dst": ["tag:initrd"],
      "users": ["autogroup:nonroot", "root"]
    }
  ]
}
```

Even if an attacker obtains your initramfs node key, the ACLs above limit what
that node can do and help protect the rest of your network.

If you suspect compromise:

- Remove the initrd device from the Tailscale admin console.
- Re-run `setup-initcpio-tailscale` to register a fresh node and rebuild your
  initramfs.

## Development

The test suite runs in a throwaway Arch container and never touches your
system:

```sh
make test        # lint, packaging, initramfs image contents
make test-all    # adds the QEMU boot matrix against a local headscale
```

Everything else a contributor needs -- what ships, the template PKGBUILD,
the boot scenarios, how releases are cut -- is in
[CONTRIBUTING.md](https://github.com/dangra/mkinitcpio-tailscale/blob/master/CONTRIBUTING.md).

## Prior work and big thanks

- [@tavianator][gh1] for early work and inspiration:
  <https://gist.github.com/tavianator/6b00355cedae0b2ceb338e43ce8e5c1a>
- [@karepker][gh2] for a detailed rootfs unlocking guide for Raspberry Pi + Arch
  Linux
- [@classabbyamp][gh3] for a similar mkinitcpio hook for non-systemd initramfs
  on Void Linux (and the idea to use ACLs)
- [@wolegis][gh4] for mkinitcpio-systemd-extras, inspiration for the systemd
  hook

[gh1]: https://github.com/tavianator
[gh2]: https://github.com/karepker
[gh3]: https://github.com/classabbyamp
[gh4]: https://github.com/wolegis
[aur]: https://aur.archlinux.org/packages/mkinitcpio-tailscale
[hs]: https://headscale.net
[releases]: https://github.com/dangra/mkinitcpio-tailscale/releases
[extras]: https://aur.archlinux.org/packages/mkinitcpio-extras
[sdextras]: https://aur.archlinux.org/packages/mkinitcpio-systemd-extras
[nfsutils]: https://archlinux.org/packages/core/x86_64/mkinitcpio-nfs-utils/
[1]: https://wiki.archlinux.org/title/Mkinitcpio
[2]: https://tailscale.com
[3]: https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2
[4]: https://wiki.archlinux.org/title/Dm-crypt/Specialties#Remote_unlocking_of_root_(or_other)_partition
