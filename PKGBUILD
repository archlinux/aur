# Maintainer: Jonathan Wright <jon@than.io>

pkgname=terraform-tpm-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A package manager for Terraform providers"
arch=('x86_64' 'arm64')
pkgurl="https://github.com/Madh93/tpm"
license=('MIT')
makedepends=('unzip')
optdepends=()

source=("tpm-Linux-x86_64.tar.gz::${pkgurl}/releases/download/v${pkgver}/tpm_Linux_x86_64.tar.gz")
sha512sums=('9719c6b7378b68b9b290f9a603ac9be4f5f90e77e6c4d39d6d9d422708c654d7f3ed535b276f6714b9883576f655942ed2e8aefda3c48245cd94073bc7e4b5e0')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/tpm" "${pkgdir}/usr/bin/tpm"
  install -D -g root -m 0644 -o root "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
