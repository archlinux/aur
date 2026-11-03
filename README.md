# nvidia-open-p2p-dkms

Patched NVIDIA kernel modules for GPU-to-GPU transfers over PCIe BAR1 or
NVLink, including between generations. No extra NVIDIA module parameters are
needed.

- Source fork: <https://github.com/aikitoria/open-gpu-kernel-modules>
- Replaces `nvidia-open-dkms`; DKMS rebuilds for every installed kernel
- Requires IOMMU passthrough (`iommu=pt`) and Resizable BAR in firmware
- Mixed-generation P2P also needs the `libcuda` patch, not shipped here

## Optional: force PCIe over NVLink

No module parameters are needed by default. To force PCIe BAR1 even when an
NVLink bridge is present, add this file by hand; the package does not ship it:

```bash
echo 'options nvidia NVreg_RegistryDwords="RMForceP2PType=1"' \
  | sudo tee /etc/modprobe.d/nvidia-p2p.conf
sudo modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia
sudo modprobe nvidia
```

## Deploy

Build and install (replaces the stock modules, then reboot):

```bash
makepkg -si
```

Release: bump `pkgver`, `_commit`, and `pkgrel` in `PKGBUILD`, then:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -A && git commit -S -m "Update to <version>"
git tag -s <version> -m "nvidia-open-p2p-dkms <version>"
```

Publish to the AUR with `git push origin master`. The AUR accepts only the
`master` branch and rejects tags, so push release tags to a mirror instead
(for example `git push <mirror> master --follow-tags`).
