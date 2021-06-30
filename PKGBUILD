# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>
_projectname='monotonic'
pkgname="python2-$_projectname"
pkgver='1.6'
pkgrel='1'
pkgdesc='An implementation of time.monotonic() for Python - python2 version'
arch=('any')
url="https://pypi.python.org/pypi/$_projectname"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/atdt/$_projectname/archive/$pkgver.tar.gz")
sha256sums=('9609c249aed584fd714811014870650d08d6f6414402b5a190663c49bf83b221')

package() {
	cd "$srcdir/$_projectname-$pkgver/"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
