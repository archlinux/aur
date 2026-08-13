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
sudo setup-initcpio-tailscale
```

The helper starts a throwaway `tailscaled` and prints a URL and QR code to
authenticate with; it does not touch the Tailscale service your booted system
runs. Any extra arguments are passed straight through to `tailscale up`, so
flags like `--login-server=` work as usual.

It registers a node named after your host with an `-initrd` suffix (a machine
called `homeserver` appears as `homeserver-initrd`) with [Tailscale
SSH](#tailscale-ssh-server) turned on, and leaves the node key and the SSH host
keys in `/etc/initcpio/tailscale/`. Pass `--no-ssh` if you would rather run
`dropbear` or `tinyssh` in the image instead.

**Disable key expiry for that node** in the [machines
list](https://console.tailscale.com/admin/machines). Node keys expire by default,
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

Before rebooting a machine you cannot walk up to, confirm the image really
carries Tailscale and that the node is live:

```sh
lsinitcpio -l /boot/initramfs-linux.img | grep tailscale
tailscale status | grep -- -initrd    # from any other node on your tailnet
```

### Give yourself more than 90 seconds

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
`encryptssh` hooks have no such timeout.

### Tailscale SSH server

Tailscale includes a built-in SSH server, and `setup-initcpio-tailscale` turns it
on unless told otherwise, so you need no `dropbear`, `tinyssh`, or other SSH
server inside the initramfs. Logging in is then:

```sh
ssh root@homeserver-initrd
```

Turn it off with:

```sh
sudo setup-initcpio-tailscale --no-ssh
```

which also removes any host keys an earlier run left in
`/etc/initcpio/tailscale/`, so they stop being copied into new images.

Note: the Tailscale SSH server only accepts connections from within your
tailnet. The node won't accept local connections unless the client is also part
of your Tailscale network, which reduces exposure compared to a traditional SSH
server reachable from everywhere.

The helper also generates OpenSSH host keys and stores them alongside the node
key, so the initramfs presents the same host key every time and your client does
not warn about a changed identity.

Works on systemd- and busybox-based initramfs alike, though the second needs a
hand: Tailscale's SSH server has to resolve the user you log in as, and of the
hooks mkinitcpio ships only `systemd` writes a user database into the image. On
a busybox-based initramfs this hook therefore writes a minimal one itself:
`root`, with `/bin/sh` as the shell, since that is what such an image actually
contains. Where a database already exists it is left untouched, so a
systemd-based image keeps the richer one mkinitcpio built.

That also fixes the same problem for other SSH servers in early userspace.
Without a user database `dropbear` and `tinyssh` start, accept the connection,
and then refuse every login with `Permission denied (publickey)`. The old
standalone hooks never wrote one, and the maintained `mkinitcpio-extras` fork
does so only if you turn its root-shell option on. This hook writes one whenever
the image has none, so they work either way, and skips it when a database is
already there, so the two cannot collide.

**Run one SSH server, not two.** When Tailscale SSH is enabled, tailscaled
answers port 22 on the tailnet itself, so a dropbear or tinyssh in the same
initramfs never sees those connections; it still answers on other interfaces,
but not on the address you would actually reach it at. Either keep the default
and use Tailscale SSH, or register with `--no-ssh` and use your own daemon.

The test suite covers this end to end on both branches: it boots the image, logs
in over Tailscale SSH from a second node on a throwaway tailnet, and checks the
host key offered is the one `setup-initcpio-tailscale` generated.

## Security considerations

The Tailscale node key is stored in plaintext inside the initramfs. Initramfs is
usually not encrypted, so physical access to the machine could allow an attacker
to extract the node key and impersonate your initrd node on your tailnet.

Mitigations:

- Restrict what the initramfs node can access with Tailscale ACLs and tags. Tag
  the initrd node in the Machines panel and limit its permissions.
- Prefer granting the initrd node only the minimal access required (for example,
  only allow SSH from a narrow set of client tags).
- If a node is ever compromised, remove it from the Tailscale admin panel
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

Run the test suite in a throwaway Arch container:

```sh
make test        # lint, packaging, initramfs image contents
make test-all    # adds the QEMU boot tests against a local headscale
```

`make test-all` boots two images against a throwaway headscale (one systemd,
one busybox, both registered the way the setup helper registers them when left
alone) and checks each node comes online, then logs in over Tailscale SSH and
compares the host key it is offered with the one `setup-initcpio-tailscale`
generated. The `--no-ssh` opt-out is checked there too, on the configuration it
writes rather than with a boot of its own. A single scenario can be run on its
own:

```sh
./tests/container.sh 04     # both, the way CI runs them
BOOT_SCENARIOS=busybox ./tests/container.sh 04
```

### Releasing

`PKGBUILD` in this repository is a **template, not a finished package
definition**. `pkgver`, `pkgrel` and `sha256sums` are placeholders, and
`.SRCINFO` is not tracked at all; they are generated at release time by
`scripts/aur-stage.sh`. Running `makepkg` directly here produces a package
labelled `0.0.0`; use `make build` instead, which stages a complete definition
first.

A release is cut by pushing a tag. The tag is the only source of truth for the
version:

| Tag        | Publishes    |
| ---------- | ------------ |
| `v1.2.0`   | `1.2.0-1`    |
| `v1.2.0-2` | `1.2.0-2`    |

```sh
git tag v1.2.0 && git push origin v1.2.0
```

That runs the full test suite and, only if it passes, publishes to the AUR: a
curated tree of packaging files only, never `tests/` or `.github/`. Use
`v<version>-<rel>` for a packaging-only rebuild of a version already published.

Once the AUR push has landed, the same workflow opens a [GitHub
release][releases] for the tag, with the built `.pkg.tar.zst` attached. That
package comes from the staged tree, not from the test suite's artifact, which is
deliberately labelled `9.9.9-3`. Tags and releases go back to `0.1-6`; the ones
before `1.2.0` were published by hand and were tagged after the fact, so they
carry notes but no package.

Every pull request, and every push to `master`, runs the same release path in
dry-run mode against the live AUR repository, which it clones anonymously over
HTTPS so no credentials are involved, and prints the diff it would push. The
publish logic is therefore exercised continuously rather than only during a
release.

To rehearse locally:

```sh
# against the real AUR, read-only
AUR_REMOTE=https://aur.archlinux.org/mkinitcpio-tailscale.git \
  ./scripts/aur-publish.sh --dry-run --tag v1.2.0

# or against a scratch repo, including the push
git init --bare /tmp/fake-aur.git
AUR_REMOTE=/tmp/fake-aur.git ./scripts/aur-publish.sh --tag v1.2.0
```

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
[releases]: https://github.com/dangra/mkinitcpio-tailscale/releases
[extras]: https://aur.archlinux.org/packages/mkinitcpio-extras
[sdextras]: https://aur.archlinux.org/packages/mkinitcpio-systemd-extras
[nfsutils]: https://archlinux.org/packages/core/x86_64/mkinitcpio-nfs-utils/
[1]: https://wiki.archlinux.org/title/Mkinitcpio
[2]: https://tailscale.com
[3]: https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2
[4]: https://wiki.archlinux.org/title/Dm-crypt/Specialties#Remote_unlocking_of_root_(or_other)_partition
