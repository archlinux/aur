# Maintainer: Pieter Lenaerts <pieter DOT aj DOT lenaerts AT gmail.com>
pkgname=ofxstatement-be-kbc
pkgver=0.1.1
pkgrel=1
pkgdesc="Belgian KBC Bank plugin for ofxstatement"
arch=('any')
url="https://github.com/plenaerts/ofxstatement-be-kbc"
license=('GPL3')
depends=('python' 'ofxstatement')
source=(https://github.com/plenaerts/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('21427fad6a90fea73afe793cc1a60b3316a441048d297c6f70b43719f77a49cd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
