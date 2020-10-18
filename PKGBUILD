# Maintainer: robertfoster

pkgname=python-rlp
pkgver=2.0.0
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.python.org/pypi/rlp'
license=('MIT')
arch=('any')
depends=('python' 'python-eth-utils')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

package() {
	cd $srcdir/rlp-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('e69771e34bfa870ba1dba5b3f9b97798')
