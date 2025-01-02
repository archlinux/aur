# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=mgccli
pkgver=0.31.0
pkgrel=1
pkgdesc="Magalu Cloud CLI"
arch=("x86_64")
url="https://github.com/MagaluCloud/mgccli"
license=("GPL3")

source=("$pkgname-$pkgver.tar.gz::https://github.com/MagaluCloud/mgccli/releases/download/v${pkgver}/mgccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('299b0b192f8a7a07505539468dbc0aead6ea37327b5c9297cd31727f3c9a0fda')

package() {
  install -D -m 0755 mgc ${pkgdir}/usr/bin/mgc
}
