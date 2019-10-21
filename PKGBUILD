# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.4
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-all-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(9f31f72e56a6a208ea5a2c5584e1a7b8d1ec1fd4c847cc91c2fa4d7ce7b8cf96)

package() {
	install -D -m 755 "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
