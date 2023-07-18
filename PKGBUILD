# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.24
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
b2sums=('269ff78b35f41a4f416802af574f304f272a34ce138ae27bf7e7efd5c20fefe1293d484fb3174bdda606d8ecc03e195587a5329975389db86ac2fd41e2b518ff')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}

