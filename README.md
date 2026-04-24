# jetm-kernel-settings

Personal replacement for `cachyos-settings`, scoped to kernel-level tuning only
and customised for jetm's hardware profile.

## Hardware target

- AMD Ryzen 9 9950X (32 threads)
- 91 GB RAM, 92 GB zram (zstd) swap
- Storage: 2x SATA HDD + 1x SATA SSD + 1x NVMe
- GPU: AMD RX 9060 XT (RDNA4) + iGPU - no NVIDIA
- Workload: Hyprland desktop + heavy Yocto bitbake builds

## What it ships

| Category | Files |
|---|---|
| sysctl | `/usr/lib/sysctl.d/70-jetm-kernel.conf` |
| udev | `/usr/lib/udev/rules.d/{20-audio-pm,30-zram,40-hpet-permissions,50-sata,60-ioschedulers,69-hdparm,85-iw-regulatory,99-cpu-dma-latency}.rules` |
| modprobe | `/usr/lib/modprobe.d/blacklist.conf` |
| modules-load | `/usr/lib/modules-load.d/ntsync.conf` |
| tmpfiles | `/usr/lib/tmpfiles.d/{coredump,thp,thp-shrinker}.conf` |
| systemd drop-ins | journald, system, user, timesyncd, rtkit-daemon, user@, docker |
| systemd services | `jetm-iw-set-regdomain.{service,path}` |
| zram-generator | `/etc/systemd/zram-generator.conf` (backup=) |
| helper | `/usr/lib/iw-set-regdomain` |

## Deltas vs upstream cachyos-settings

- Consolidated all sysctl into one file with inline comments.
- `vm.swappiness = 10` (cachyos ships 100) for Yocto bitbake stability.
- `/usr/lib/udev/rules.d/30-zram.rules` no longer forces
  `SYSCTL{vm.swappiness}="150"` on zram0 init - that override was
  clobbering the sysctl value.
- Dropped NVIDIA bits: `modprobe.d/nvidia.conf`, `udev/rules.d/71-nvidia.rules`.
- Dropped `modprobe.d/amdgpu.conf` (targets old GCN, not RDNA4).
- Dropped non-kernel upstream bits: X11 touchpad, NetworkManager DoT,
  audio RT limits, GNOME login-screen override, cachyos utility scripts.
- Renamed `cachyos-iw-set-regdomain.*` systemd units to
  `jetm-iw-set-regdomain.*` to match the package name.
- Added a `docker.service.d/00-jetm-limits.conf` drop-in (net-new,
  not in upstream cachyos) bumping `LimitNOFILE` and `TasksMax` to
  `infinity` on the `dockerd` process for Yocto workstation load.
  Container-level ulimits remain admin-managed via
  `/etc/docker/daemon.json` (intentionally not shipped by this
  package - Docker has no drop-in merge mechanism for daemon.json).

## Deployment

`replaces=()` is only honoured by pacman sync ops (`-Sy`), not by
`pacman -U` (what `makepkg -si` calls). So:

```bash
cd ~/repos/personal/aur-packages/packages/jetm-kernel-settings
makepkg -f                              # build only
makepkg --printsrcinfo > .SRCINFO       # regenerate AUR metadata
sudo pacman -Rns cachyos-settings       # remove upstream first
sudo pacman -U jetm-kernel-settings-*.pkg.tar.zst

# Migrate away from /etc/sysctl.d/99-*.conf (now shadowed by this pkg)
sudo rm -f /etc/sysctl.d/{70-cachyos-settings,99-personal,99-vm-zram-parameters,99-yocto}.conf
sudo sysctl --system
systemctl enable --now jetm-iw-set-regdomain.path
```

## Boot-cmdline caveat

Two settings from the prior `/etc/sysctl.d/99-personal.conf` do **not**
belong in sysctl - they are kernel boot / module params and silently
no-op when set that way:

- `page_alloc.shuffle=1`
- `rcupdate.rcu_expedited=1`

To keep them active, add them to the kernel cmdline in your bootloader
config. They are not shipped by this package.

## Upstream tracking

`dotfiles-update` tracks the upstream `CachyOS/CachyOS-Settings` repo.
When a new release lands, review the diff and decide which changes to
port into this package. Do NOT auto-bump `pkgver` to follow upstream -
version this package on its own cadence.

## Verification

```bash
pacman -Qi jetm-kernel-settings
pacman -Qi cachyos-settings            # should error: not installed
sysctl vm.swappiness                   # expect 10
sysctl vm.vfs_cache_pressure           # expect 50
sysctl fs.inotify.max_user_instances   # expect 8192
sysctl net.ipv4.tcp_congestion_control # expect bbr

# Confirm 30-zram.rules no longer overrides swappiness
sudo swapoff /dev/zram0 && sudo swapon /dev/zram0
sysctl vm.swappiness                   # still 10 (not 150)

# I/O schedulers
cat /sys/block/sda/queue/scheduler     # [bfq] for rotational
cat /sys/block/sdc/queue/scheduler     # [mq-deadline] SATA SSD
cat /sys/block/nvme0n1/queue/scheduler # [kyber] or [none] NVMe
```
