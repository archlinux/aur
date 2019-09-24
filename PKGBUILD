# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.7.9
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(902d74737d05ef64b3782fc37b552e8e23b0eb21d8633d1b28a99ebcf93173b4)

package() {
	chmod +x "${_binary}"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
