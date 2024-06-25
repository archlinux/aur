# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: slact (https://aur.archlinux.org/account/slact)
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant (https://aur.archlinux.org/account/m13253)

_pkgname=upower
pkgname="${_pkgname}-nocritical-nosystemd-git"
pkgver=1.90.4+10.r1708.20240523.669a1c2
pkgrel=3
pkgdesc="Transitional package to switch to '${_pkgname}-nosystemd-git', since the Ingore action is now included in upstream git. This package can be deleted now."
arch=(
  'any'
)
url="http://upower.freedesktop.org"
license=(
  'GPL-2.0-or-later'
)
depends=(
  "${_pkgname}-nosystemd-git"
)
makedepends=(
  'awk'
  'pacman'
)
optdepends=()
provides=()
conflicts=()
backup=()
install="upower-nocritical.install"
source=()
sha256sums=()
options+=('emptydirs')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  pacman -Q "${_pkgname}-nosystemd-git" | awk '{print $2}' | awk -F- '{print $1}'
}

# package() {
#   true
# }
