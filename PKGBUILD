# Maintainer: portaloffreedom

_pkgsrcname=padatious
pkgname=python-padatious
pkgver=0.4.0
pkgrel=1
pkgdesc="A neural network intent parser"
url="http://github.com/MycroftAI/padatious"
license=("Apache2.0")
arch=("any")
depends=('python' 'python-xxhash' 'python-fann2')
source=("https://github.com/MycroftAI/$_pkgsrcname/archive/v$pkgver.tar.gz")
sha256sums=('ade78780cd6f140501969cc7a83c2ad3c1c7a0823162b00e34c82e853a10fd44')

build() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


