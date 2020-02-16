# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.6
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-all-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(9eb4c239166074456b38e5056f6a1e73aa48aae7b35327829a2081754337963d)

package() {
	install -D -m 755 "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
