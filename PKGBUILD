# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.5
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-all-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(2366e28acecc399d2cc8029c82948c48e84f14ba1f5deb6e609310fdae81b065)

package() {
	install -D -m 755 "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
