# Maintainer: robertfoster

pkgname=python-rlp
pkgver=1.1.0
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.python.org/pypi/rlp'
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

package () {
	cd $srcdir/rlp-$pkgver
	python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('a94a3b0e5804f39a08cb575249bc39ed')
