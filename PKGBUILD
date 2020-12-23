# Maintainer: robertfoster

pkgname=python-rlp
pkgver=2.0.1
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.python.org/pypi/rlp'
license=('MIT')
arch=('any')
depends=('python' 'python-eth-utils')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

package() {
  cd "$srcdir/${pkgname##python-}-$pkgver"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}

md5sums=('08c3cd5711b1ccd12d0b457bf0d49eb0')
