# libvirt-hyperv

Arch Linux's libvirt 12.8.0 package rebuilt with the client-side Microsoft
Hyper-V driver enabled. The remaining build options follow the Arch package.

The package base produces:

- `libvirt-hyperv`: replaces `libvirt`, provides its versioned dependency and
  shared libraries, and adds `libwsman` as a runtime dependency.
- `libvirt-hyperv-storage-gluster`: replaces and provides
  `libvirt-storage-gluster`.
- `libvirt-hyperv-storage-iscsi-direct`: replaces and provides
  `libvirt-storage-iscsi-direct`.

The storage packages depend on the matching `libvirt-hyperv` version. Install
them together with the main package if you use those backends. The original
configuration backup entries are retained.

## Build

Install the AUR dependency `libwsman` first. It builds the C and C++
client libraries without the server or language bindings. An
AUR helper can resolve these, for example:

```sh
paru -S libwsman
makepkg -s
```

`makepkg -s` installs the remaining repository build dependencies and builds
all three packages, including the upstream test suite. Alternatively, install
`libvirt-hyperv` through an AUR helper after publication.

## Connect to Hyper-V

```sh
virsh -c 'hyperv://Administrator@hyperv.example.com/' list --all
```

The driver connects directly to the remote Hyper-V host using WinRM / WS-Man.
The default transport is HTTPS on port 5986. Configure WinRM authentication and
the HTTPS listener on the Windows host as described in the
[libvirt Hyper-V documentation](https://libvirt.org/drvhyperv.html).

## Update and publish

Update `pkgver` / `pkgrel`, the `keycodemapdb` commit to match the new
libvirt tag, and both source checksums. Build and test the package, then
regenerate the AUR metadata before pushing:

```sh
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO README.md LICENSE .gitignore
git commit -m 'Update libvirt-hyperv'
git push origin master
```

AUR stores the build recipes, not the built `.pkg.tar.zst` archives.

Based on the [Arch Linux libvirt packaging repository](https://gitlab.archlinux.org/archlinux/packaging/packages/libvirt).
The upstream packaging license is retained in `LICENSE`.
