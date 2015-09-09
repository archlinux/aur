# Maintainer: Yen Chi Hsuan
# Contributor: Penguin <TGates81.at.gmail.dot.com>

_pkgname=pylzma
pkgname=python2-$_pkgname
pkgver=0.4.8
pkgrel=1
pkgdesc="Platform independent python bindings for the LZMA compression library"
url="http://www.joachim-bauch.de/projects/python/pylzma"
license="LGPL"
arch=(i686 x86_64)
depends=('python2')
provides=("pylzma=$pkgver")
replaces=('pylzma')
conflicts=('pylzma')
source=(http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('7040c489c7bbd0e1a4331484e1579261')

package() {
	cd $srcdir/$_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}

