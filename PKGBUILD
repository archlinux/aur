# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=base-openrc
provides=('base')
conflicts=('base')
pkgver=3
pkgrel=1
pkgdesc='Minimal package set to define a basic Arch Linux installation (open rc version)'
url='https://www.archlinux.org'
arch=('any')
license=('GPL')
depends=(
  # very very base
  'filesystem' 'gcc-libs' 'glibc' 'bash'

  # POSIX tools
  'coreutils' 'file' 'findutils' 'gawk' 'grep' 'procps-ng' 'sed' 'tar'

  # standard linux toolset
  'gettext' 'pciutils' 'psmisc' 'shadow' 'util-linux' 'bzip2' 'gzip' 'xz'

  # distro defined requirements
  'licenses' 'pacman' 'archlinux-keyring' 'openrc' 'openrc-arch-services-git'

  # networking, ping, etc
  'iputils' 'iproute2'
)
optdepends=(
  'linux: bare metal support'
)

# vim:set sw=2 sts=-1 et:
