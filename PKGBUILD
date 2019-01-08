# Maintainer: Ken Hasselmann <arch AT kenh DOT fr>

pkgname=qidi-tech-cura
_gitname=qidi-tech-cura
pkgver=1
pkgrel=1

pkgdesc="Cura plugins for QiDi printers (qidi1, x-maker, x-plus, ...)"
arch=('i686' 'x86_64')
url="https://github.com/KenN7/qidi-tech-cura.git"
license=('MIT')

install=${pkgname}.install
depends=('cura')
makedepends=('git')

source=('git://github.com/KenN7/qidi-tech-cura.git')
md5sums=('SKIP')

build() {
    echo "downloading sources..."
}

package() {
  cd "$pkgdir"
  mkdir -p "usr/share/cura/resources"
  cp -r "$srcdir/$pkgname/definitions" "$pkgdir/usr/share/cura/resources/"
  cp -r "$srcdir/$pkgname/extruders" "$pkgdir/usr/share/cura/resources/"
  cp -r "$srcdir/$pkgname/images" "$pkgdir/usr/share/cura/resources/"
  cp -r "$srcdir/$pkgname/meshes" "$pkgdir/usr/share/cura/resources/"
}
