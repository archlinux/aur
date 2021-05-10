# Maintainer: Wispy <wspvlv@gmail.com>
pkgname=wlib
pkgver=0.1
pkgrel=1
pkgdesc="A collection of free open-source lightweight general-purpose libraries for C language"
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(SKIP) #autofill using updpkgsums

package() {
  DESTDIR="$pkgdir"
  install -Dm644 libwc.a -t ${DESTDIR}/usr/lib
  install -Dm644 libwct.a -t ${DESTDIR}/usr/lib
}