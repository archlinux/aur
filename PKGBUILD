# Substitution for Arch Linux's base -package - SELinux support
# https://wiki.archlinux.org/index.php/SELinux

# Maintainer: Tuomo Kuure <tqre@far.fi>

pkgname=base-selinux
pkgver=1
pkgrel=1
pkgdesc='Minimal packages for Arch Linux installation with SELinux support'
arch=('any')
license=('GPL')
url='https://github.com/archlinuxhardened/selinux'
groups=('selinux')
depends=(
  # Basics
  'filesystem' 'gcc-libs' 'glibc' 'bash'

  # POSIX tools
  'coreutils-selinux' 'file' 'findutils-selinux' 'gawk' 'grep' 'procps-ng' 'sed' 'tar'

  # Standard linux toolset
  'gettext' 'pciutils' 'psmisc-selinux' 'shadow-selinux' 'util-linux-selinux' 'bzip2' 'gzip' 'xz'

  # Arch Linux specific
  'licenses' 'pacman' 'systemd-selinux' 'systemd-sysvcompat-selinux' 'selinux-alpm-hook'

  # Networking
  'iputils' 'iproute2-selinux'

  # SELinux packages
  'selinux-refpolicy-arch' 'secilc' 'dbus-selinux' 'selinux-dbus-config' 'mcstrans' 'restorecond'
  'logrotate-selinux' 'checkpolicy'
)
