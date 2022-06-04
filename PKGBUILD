# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.21
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
b2sums=('473f6e85e26d718d12dc1bd37b3684486bac8a882f469002ea727270009fae7f54fb477210d98e83d9a510d9439faa014a45cd8998fbbea7edac955e47752c2e')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
