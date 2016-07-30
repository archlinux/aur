# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_core
pkgver=0.1.0
pkgrel=1
pkgdesc='Common utilities for jupyter-contrib projects'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter jupyter-notebook python-tornado)
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=(a0763c40a906e0a74fc95c3d25941c70)

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
