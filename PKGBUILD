# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=schedule
pkgname=python-schedule
pkgver=0.5.0
pkgrel=1
pkgdesc='Python job scheduling for humans.'
arch=('any')
url="https://github.com/dbader/$_name"
license=('MIT')
depends=('python>=2.3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9b9c385349e79de2933a3926bc5e8006f821dd478a453385e3e22994dea3d79')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
