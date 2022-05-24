# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.20
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
b2sums=('0bfb1908ba323426f2b7216e3dca600742b84a52d522dc23aa0f93e23e87806513ce78194af8250157e0a1efacfa8f15e1ec5a2dc1401038f5192a522cc4e903')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
