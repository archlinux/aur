# mkinitcpio-tailscale

This project provides a [mkinitcpio][1] hook that lets you connect to your
[Tailscale][2] network from inside the initramfs (the early userspace
environment, before the system switches to the final root filesystem).

It's particularly useful for remotely unlocking systems with encrypted root
filesystems. For setup details on decrypting the rootfs and adding remote unlock
support, see the Arch Linux Wiki pages linked below. If you use the built-in
Tailscale SSH server you do not need an additional SSH server — see the section
on the Tailscale SSH server for details.

- [Mkinitcpio][1]
- [Tailscale][2]
- ArchWiki: [dm-crypt / Encrypting an entire system — Configuring mkinitcpio][3]
- ArchWiki: [Dm-crypt — Remote unlocking of root (or other) partition][4]

By combining mkinitcpio with Tailscale you get a secure VPN path to your locked
server from anywhere — no need to expose SSH to the internet or open firewall
ports.

## Installation

You can install the package from the AUR:

```sh
yay -S mkinitcpio-tailscale
```

## Configure

Run the helper and follow the prompts:

```sh
sudo setup-initcpio-tailscale
```

This will register a new Tailscale node using a hostname based on your system.
For example, if your host is named `homeserver`, the node will appear as
`homeserver-initrd` in the Tailscale admin panel, which makes it easy to
identify.

Next, edit `/etc/mkinitcpio.conf` and add `tailscale` to the `HOOKS` array.

- For systemd-based initramfs, place the `tailscale` hook anywhere after the
  `systemd` hook.
- For busybox-based initramfs, add it after network-related hooks but before
  blocking hooks like `encrypt` / `encryptssh`.

Example (conceptual):

```text
HOOKS=(base systemd autodetect modconf block filesystems keyboard fsck tailscale)
# or for busybox-based initramfs: ensure tailscale is before encrypt
```

After editing `mkinitcpio.conf`, regenerate your initramfs:

```sh
sudo mkinitcpio -P
# or: sudo mkinitcpio -p linux
```

This updates your initramfs so the new hook and node key are included.

### Tailscale SSH server

Tailscale includes a built-in SSH server. If you enable it when running the
setup helper, you don't need `dropbear`, `tinyssh`, or another SSH server inside
initramfs.

Enable it with:

```sh
sudo setup-initcpio-tailscale --ssh
```

Note: the Tailscale SSH server only accepts connections from within your
tailnet. The node won’t accept local connections unless the client is also part
of your Tailscale network — this reduces exposure compared to a traditional SSH
server reachable from everywhere.

`setup-initcpio-tailscale --ssh` also generates OpenSSH host keys and stores them
alongside the node key, so the initramfs presents the same host key every time
and your client does not warn about a changed identity.

Works on systemd- and busybox-based initramfs alike, though the second needs a
hand: Tailscale's SSH server has to resolve the user you log in as, and of the
hooks mkinitcpio ships only `systemd` writes a user database into the image. On
a busybox-based initramfs this hook therefore writes a minimal one itself —
`root`, with `/bin/sh` as the shell, since that is what such an image actually
contains. Where a database already exists it is left untouched, so a
systemd-based image keeps the richer one mkinitcpio built.

That also fixes the same problem for other SSH servers in early userspace: the
`mkinitcpio-dropbear` and `mkinitcpio-tinyssh` hooks do not ship a user database
either, and without one both daemons start, accept the connection and then
refuse every login with `Permission denied (publickey)`. With this hook in
`HOOKS` they work as expected.

**Run one SSH server, not two.** When Tailscale SSH is enabled, tailscaled
answers port 22 on the tailnet itself, so a dropbear or tinyssh in the same
initramfs never sees those connections — it still answers on other interfaces,
but not on the address you would actually reach it at. Either register with
`--ssh` and use Tailscale SSH, or leave `--ssh` off and use your own daemon.

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

`make test-all` boots two images against a throwaway headscale — one systemd,
one busybox, both registered with `--ssh` — and checks each node comes online,
then logs in over Tailscale SSH and compares the host key it is offered with the
one `setup-initcpio-tailscale` generated. A single scenario can be run on its
own:

```sh
./tests/container.sh 04     # both, the way CI runs them
BOOT_SCENARIOS=busybox ./tests/container.sh 04
```

### Releasing

`PKGBUILD` in this repository is a **template, not a finished package
definition**. `pkgver`, `pkgrel` and `sha256sums` are placeholders, and
`.SRCINFO` is not tracked at all — they are generated at release time by
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

Every pull request, and every push to `master`, runs the same release path in
dry-run mode against the live AUR repository — which clones anonymously over
HTTPS, so no credentials are involved — and prints the diff it would push. The
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

- [@tavianator][gh1] — early work and inspiration:
  <https://gist.github.com/tavianator/6b00355cedae0b2ceb338e43ce8e5c1a>
- [@karepker][gh2] — detailed rootfs unlocking guide for Raspberry Pi + Arch
  Linux
- [@classabbyamp][gh3] — a similar mkinitcpio hook for non-systemd initramfs on
  Void Linux (and the idea to use ACLs)
- [@wolegis][gh4] — mkinitcpio-systemd-extras, inspiration for the systemd hook

[gh1]: https://github.com/tavianator
[gh2]: https://github.com/karepker
[gh3]: https://github.com/classabbyamp
[gh4]: https://github.com/wolegis
[1]: https://wiki.archlinux.org/title/Mkinitcpio
[2]: https://tailscale.com
[3]: https://wiki.archlinux.org/title/dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2
[4]: https://wiki.archlinux.org/title/Dm-crypt/Specialties#Remote_unlocking_of_root_(or_other)_partition
