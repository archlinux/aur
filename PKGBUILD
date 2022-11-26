# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python')
makedepends=('python-setuptools')
optdepends=()
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('297e9f5292ef609e63c470e2effb0c7aa45b4ebf6dbf0c78d98fd1f671be4392')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
