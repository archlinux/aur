# Maintainer: robertfoster

pkgbase=python-rlp
pkgname=(python-rlp python2-rlp)
pkgver=0.6.0
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

package_python-rlp() {
  cd $srcdir/rlp-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-rlp() {
  depends=('python2')
  cd $srcdir/rlp-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('433c15b0efa188752448a0dd422a5bc0')
