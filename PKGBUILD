# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=python-sge
_pkgname=sge
pkgver=2.0.2
pkgrel=1
pkgdesc="The Seclusion Game Engine, or SGE, is a general-purpose 2-D game engine."
arch=('x86_64')
url="https://python-sge.github.io/"
license=('LGPL')
depends=('python' 'python-pygame-git' 'python-uniseg')
makedepends=('python-setuptools')
provides=('python-sge')
conflicts=('python-sge')
_name=${pkgname#python-}
source=("https://github.com/python-sge/sge/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('bcd9cc46754910925f847bec249999bb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
