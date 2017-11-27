# Maintainer: Philipp A. <flying-sheep@web.de>
_name=requests_download
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc='Download to a local file using requests'
arch=('any')
url="https://github.com/takluyver/$_name"
license=('MIT')
depends=(python python-requests)
makedepends=('python-pip')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('07832a93314bcd619aaeb08611ae245728e66672efb930bc2a300a115a47dab7')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
