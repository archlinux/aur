# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=pacman-history
pkgver=0.2.0
pkgrel=2
pkgdesc="get pacman history for one file"
arch=('any')
url="https://github.com/papajoker/pacman-history"
license=('GPL')
groups=()
depends=('pacman')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+http://github.com/papajoker/pacman-history#branch=master")
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir"
  msg "Starting build..."
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ./${pkgname}.fr ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/${pkgname}
}
