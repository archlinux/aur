# Maintainer: Pieter Lenaerts <pieter DOT aj DOT lenaerts AT gmail.com>
pkgname=ofxstatement-be-kbc
pkgver=0.0.2
pkgrel=1
pkgdesc="Belgian KBC Bank plugin for ofxstatement"
arch=('any')
url="https://github.com/plenaerts/ofxstatement-be-kbc"
license=('GPL3')
depends=('python' 'ofxstatement')
source=(https://github.com/plenaerts/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('565d33041c024a25ff1d2f7f6b35ab88')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
