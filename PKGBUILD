# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(3972d8aad136d4fffdcf966b28961007e0e3be2fb5cc98003872c18bb0ee5ed3)

package() {
	chmod +x "${_binary}"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
