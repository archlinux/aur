# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python')
makedepends=('python-setuptools')
optdepends=()
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('5d58f5fe6a6e85429a1ccbf73fe4ef68e5c7cab81b39cfd157dcc2379f4edcc5')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
