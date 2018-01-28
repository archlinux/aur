# Maintainer: robertfoster

_name=sha3
pkgname=python-${_name}
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python module that implements SHA-3 (Keccak) with a hashlib-like interface"
arch=('i686' 'x86_64')
url="https://github.com/bjornedstrom/python-sha3"
license=('PSF')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/s/sha3/sha3-$pkgver.tar.gz")

build() {
  cd $srcdir/${_name}-$pkgver
  python setup.py build
}
package() {
  cd $srcdir/${_name}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('95af0d74b1c4593062599a4b2e0ad951')
