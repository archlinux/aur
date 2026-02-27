# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.207.0
pkgrel=2
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('2ec62cffc43f08438975e61c16c33e56e4eba54e21fd9b4facb1c2990f2b569fd32d7fe3c4204e69464c4da01198b40a724a6b60abdefa59aa5c0b95624d8be9')
sha512sums_aarch64=('07dd3689fad7eeed11bba521c7977fdb5438c77b63f56fe6d1991b2462ced60027f320a9077e16659820502162fd345972c67958231a6b305b30ed242b75dcb1')
b2sums_x86_64=('5c576b57d3dcbb5fb14b44ad159fb7609225d8b09891f98a5426f4bea1bad132a1589414b391466f55b4985481f23de130e38552eb4c53af652bb29e4b5ce6b1')
b2sums_aarch64=('ffe37391d6428cf2cbaf1300f5d50cd3dfa611b9fe8ce046e800855f5a54327646800ddf6bb7e0c037b23f1bd718f6c319fb86b55a97bf1d5859d06f9616302e')

package() {
  install -Dm755 "${srcdir}/atmos_${pkgver}_linux_bin" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
