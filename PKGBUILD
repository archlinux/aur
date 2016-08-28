# Maintainer: Pieter Lenaerts <pieter DOT aj DOT lenaerts AT gmail.com>
pkgname=ofxstatement-be-kbc
pkgver=0.0.1
pkgrel=1
pkgdesc="Belgian KBC Bank plugin for ofxstatement"
arch=('any')
url="https://github.com/plenaerts/ofxstatement-be-kbc"
license=('GPL3')
depends=('python' 'ofxstatement')
source=(https://github.com/plenaerts/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('48ecacdd40c39e32b7c89faead2c5c7d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
