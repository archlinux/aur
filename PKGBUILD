# Maintainer: Lex Black (autumn-wind at web.de)

pkgname=gimp-plugin-arrow
pkgver=0.0.1
pkgrel=1
pkgdesc="easy drawing of arbitrary arrows into an image or a new layer"
arch=('any')
url="http://registry.gimp.org/node/20269"
license=('GPLv2+')
depends=('gimp')
source=('http://registry.gimp.org/files/arrow.scm')
md5sums=('b4884e98af53ac04b619c661cf6d5bec')


package() {
  install -D arrow.scm $pkgdir/usr/share/gimp/2.0/scripts/arrow.scm
}
