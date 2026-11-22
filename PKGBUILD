# Maintainer: Stefan Gehr <stefan@gehr.xyz>

_pyname=krpc
pkgname=python-krpc
pkgver=0.8.0
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=('LGPL-3.0-only')
arch=('any')
depends=('python' 'python-protobuf')
makedepends=('python-installer')
noextract=("$_pyname-$pkgver-py3-none-any.whl")
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/$_pyname-$pkgver-py3-none-any.whl")
sha256sums=('b2bae6c1b032d3c17faf67564f097acc7477f30e7af85091c2caa6bbf6512bb6')

package() {
	python -m installer --destdir="$pkgdir" "$_pyname-$pkgver-py3-none-any.whl"
}
