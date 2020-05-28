# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.7
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
_binary="terraformer-all-linux-amd64"
source=("${url}/releases/download/${pkgver}/${_binary}")
sha256sums=(bff3ba338a69690a3e3ad0e130c8b49b04fe373f6672caf6c5c49edc4425742e)

package() {
	install -D -m 755 "${_binary}" "${pkgdir}/usr/bin/terraformer"
}
