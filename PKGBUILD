# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.22
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
b2sums=('af5aae1233745cffb6b0068ccf186b21c187714c45c0bb0242f3b67b50b36f54e586a6f96d11f5d76bb180cb7b091184af5fe789fb50ca48e708c1306a406aed')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
