# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=base-init-agnostic
pkgver=2
pkgrel=2
pkgdesc="Even more minimal package set to define a basic Arch Linux installation"
arch=('any')
url="https://www.archlinux.org"
license=('GPL')
depends=(
  # very very base
  'filesystem' 'gcc-libs' 'glibc' 'bash'

  # POSIX tools
  'coreutils' 'file' 'findutils' 'gawk' 'grep' 'procps-ng' 'sed' 'tar'

  # standard linux toolset
  'gettext' 'pciutils' 'psmisc' 'shadow' 'util-linux' 'bzip2' 'gzip' 'xz'

  # distro defined requirements
  'licenses' 'pacman' 'udev' 'systemd-libs-fake'

  # networking, ping, etc
  'iputils' 'iproute2'
)
optdepends=(
	'linux: bare metal support'
	'shsysusers: systemd-sysusers functionality'
)
