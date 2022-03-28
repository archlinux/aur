# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.19
pkgrel=1
pkgdesc='CLI tool to generate terraform files from existing infrastructure (reverse Terraform)'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/googlecloudplatform/${_pkgname}"
license=('Apache')
depends=('terraform')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}"::"${url}/releases/download/${pkgver}/${_pkgname}-all-${_goos}-${_goarch}")
b2sums=('0ef11d3b19b7f1abbb871865232303f17c50373e875aff7a429562b85f58175e130406fcae175c5606f3f2392b5432b1bf26e8730d56476e48be67db5c1e9138')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
