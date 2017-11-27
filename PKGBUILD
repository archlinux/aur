# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=flit
pkgver=0.12.3
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=('python')
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('ce53f0dacbc1272a5e36ba79cfc37fe5230c94bb6c9ae772886d0ba830a068f1')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
