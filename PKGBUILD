# Maintainer: robertfoster

pkgname=python-rlp
pkgver=1.0.3
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.python.org/pypi/rlp'
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

build() {
  cd $srcdir
}

package () {
  cd $srcdir/rlp-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('c3e99152796791c22f451a0fa34f525c')
