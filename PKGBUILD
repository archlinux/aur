# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.1.1
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python>=3.6.0' 'libpng' 'libjpeg-turbo')
makedepends=('python-setuptools')
optdepends=()
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('3fa8e19416bccdca357a047598e5887ec624b8b31125322cf1396bc496e938df')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
