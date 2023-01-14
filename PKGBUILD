# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python>=3.6.0' 'libpng' 'libjpeg-turbo')
makedepends=('python-setuptools')
optdepends=()
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4b4d96718565179d55ef469b02bffca736a3cbefd5223cb3b2a86e90d68e3bf9')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
