# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.210.1
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('8f7f20d0374c2d8e1644856cc9e11dcb8a1215fba40ce9765f89c626fa9be041a4145aef335b987b2b95acb86cb89d9e29a2b9db7200e58d2cc0673e3b5132c4')
sha512sums_aarch64=('a8cd6c52eff129d718342b3522d199712d95b9d576a36b84d324f005b4556b2f5707a719b6671ac7bbd58830f30717cf77f20eb4802f3c3885b90690b54bd06d')
b2sums_x86_64=('63530f7738405051f8e1951134060b2e5f054d37109118d4c97cd59e02c23bc79436b3700dd2b45f619eb8f7be87c21068940bef9a63cff27bdd1f7c7608029c')
b2sums_aarch64=('2375b6a977ed9c88ec8c832882abacee805c5de14c04b81d3f6f23f074b5591098836cb65d851878470d5bbd2fe2a9f1517768d8c0142a4a2be9e49d82e2ceba')

package() {
  install -Dm755 "${srcdir}/atmos_${pkgver}_linux_bin" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
