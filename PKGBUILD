# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=python-xsge
_pkgname=xsge
pkgver=2021.10.11
pkgrel=2
pkgdesc="xSGE is a collection of higher-level extensions for the SGE which
enhance the core functionality in an implementation-independent way."
arch=('x86_64')
url="https://python-sge.github.io/"
license=('LGPL')
depends=('python' 'python-pygame-git' 'python-sge')
makedepends=('python-setuptools')
provides=('python-xsge')
conflicts=('python-xsge')
_name=${pkgname#python-}
source=("https://github.com/python-sge/xsge/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3e0f3e7e57d3cdb6d868c0e72db1e02a')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
