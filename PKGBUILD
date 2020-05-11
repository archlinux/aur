# Maintainer: portaloffreedom

_pkgsrcname=padatious
pkgname=python-padatious
pkgver=0.4.7
pkgrel=1
pkgdesc="A neural network intent parser"
url="http://github.com/MycroftAI/padatious"
license=("Apache2.0")
arch=("any")
depends=('python' 'python-xxhash' 'python-fann2')
source=("https://github.com/MycroftAI/$_pkgsrcname/archive/v$pkgver.tar.gz")
sha256sums=('5476fe79f5192740732ec4d28bc4aa5faa7d62447db9a642e176df22962b4356')

build() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


