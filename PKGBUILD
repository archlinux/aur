# Maintainer: Bottersnike <bottersnike237@gmail.com>
pkgname=pxls
pkgver=0.0.2a
pkgrel=1
pkgdesc="A minimal image-based golfing language"
arch=('any')
url="https://github.com/Bottersnike/PxLs"
license=('MIT')
groups=()
depends=('python' 'python-pygame')
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

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp -p "pxls" "$pkgdir/usr/bin"
  cp -p "pxlst" "$pkgdir/usr/bin"
}

md5sums=('SKIP')
