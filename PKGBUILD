# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python')
makedepends=('python-setuptools')
optdepends=()
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('3015cc10343bdbd8ac7e994d74103d7266462a2b55ad29585de5c0d502de62a1')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
