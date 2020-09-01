# Maintainer: Philipp A. <flying-sheep@web.de>
_name=canvasapi
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='API wrapper for Instructures Canvas'
arch=(any)
url='https://github.com/ucfopen/canvasapi'
license=(MIT)
depends=(python)
makedepends=(pandoc)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d2af62c3f643cbf25024ea094212c9b2374c68c9e03932154079613483fc38c2')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
