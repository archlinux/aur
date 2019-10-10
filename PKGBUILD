# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.2
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(dcc39afde53bdffe6a60ec0c49d9fb1d8ed6947d863e18a5198dfeba25358ff4)

package() {
	chmod +x "${_binary}"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
