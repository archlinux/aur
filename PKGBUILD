# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-cliapp
pkgver=1.20150305
pkgrel=1
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url="http://liw.fi/cliapp/"
license=('GPL2')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-cliapp/python-cliapp_$pkgver.orig.tar.gz")
sha256sums=('bfd6d21cbde11e1bc691ed5914fb0c99a36ecc9b0fce1041faa3f2c39e70cbd0')

build() {
  cd "$srcdir/cliapp-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/cliapp-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
