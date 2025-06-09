# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=demonos-backgrounds
_pkgname=wallpapers
pkgver=1.r.
pkgrel=1
epoch=
pkgdesc="The wallpapers from demonos."
arch=('any')
url="https://github.com/demonkingswarn/${_pkgname}.git"
license=('GPL3')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(demonos-backgrounds)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -d ${pkgdir}/usr/share/backgrounds/demonos-backgrounds/
  cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/backgrounds/demonos-backgrounds/
}
