# Maintainer: Philipp A. <flying-sheep@web.de>

_name=psaw
pkgname=python-$_name
pkgver=0.1.0
pkgrel=2
pkgdesc='Pushshift.io API Wrapper for reddit.com public comment/submission search'
arch=('any')
url="https://github.com/dmarx/$_name"
license=('BSD')
depends=(python python-requests python-click)
makedepends=(python-installer)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('0d62ad9964dfbe9943b2089b25d3e44a7604794491a24a009c4262b2397fed6b')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
}
