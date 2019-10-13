# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.3
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(d51751fdc431edf9ae61fa87157470eb3bd4b4cb221b5640605f6b87a098f866)

package() {
	install -D -m 755 "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
