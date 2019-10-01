# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.1
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(06059f9434a26b9b8a07bdb94bb5cf3ce903074ac536ac12a02d2d2ffa39ad24)

package() {
	chmod +x "${_binary}"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
