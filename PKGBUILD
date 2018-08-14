# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Penguin <TGates81.at.gmail.dot.com>

_pkgname=pylzma
pkgname=python2-$_pkgname
pkgver=0.4.9
pkgrel=1
pkgdesc="Platform independent python bindings for the LZMA compression library"
url="https://www.joachim-bauch.de/projects/pylzma/"
license=("LGPL2.1")
arch=(i686 x86_64)
depends=('python2')
makedepends=('python2-setuptools')
provides=("pylzma=$pkgver")
replaces=('pylzma')
conflicts=('pylzma')
source=(https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('77e9b143ac0ddc98b82d01ba7456e30a')

package() {
	cd $srcdir/$_pkgname-$pkgver
	python2 setup.py install --root=$pkgdir --optimize=1
}

