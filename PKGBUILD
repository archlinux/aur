_name=smart-progress
pkgname=python-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc='Smart progressbar with multiple backends selected depending on the environment'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
md5sums=('f209cf90c991831c425e481d013f37fd')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}