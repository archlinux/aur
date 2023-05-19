# Maintainer: Jonathan Wright <jon@than.io>

pkgname=terraform-tpm-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A package manager for Terraform providers"
arch=('x86_64' 'arm64')
pkgurl="https://github.com/Madh93/tpm"
license=('MIT')
makedepends=('unzip')
optdepends=()

source=("tpm-Linux-x86_64.tar.gz::${pkgurl}/releases/download/v${pkgver}/tpm_Linux_x86_64.tar.gz")
sha512sums=('e0c7acc22d76233fc97d51f7a7aeaf18d27315e339108ca2aa73ffc62d36363a97c36dc4e02c3a21cda9f224117575eaef83c0c30d3c9cc08a80231e8924a533')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/tpm" "${pkgdir}/usr/bin/tpm"
  install -D -g root -m 0644 -o root "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
