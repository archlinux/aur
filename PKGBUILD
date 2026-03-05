# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.208.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("atmos_${pkgver}_linux_bin::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('edbb66c244462035067e738ddb49dad16cfab0b2170e9d35c946396651a200178c2e780a670eca82f9550fe3c7d38b8e8d80616f2864d43f96f2800e6f40fecd')
sha512sums_aarch64=('0fd290efa556e741fda67a1a0efe62cb6f87eb9177eb8b2c414c6f13b459ba86bdd8d4157552e86e5be1f5ed164d8b0184d46f08e0ff5c23809572e875cf90c1')
b2sums_x86_64=('1d7868494ead7d7e7794b6e110f3e92d4ef93374bff74ca2fe3a6d41eb120991646a9fcae2c15284aa94dc56a0d3ca1ba0435c1260289f1e78b2b6ed582f31c6')
b2sums_aarch64=('c25b42ed018a747c76e2371d69ac788ab1e281af262cd81f2faa976da875e011505066bd6547230788408da35c7866046a96aca55b759f2b268086ceb0d7ec51')

package() {
  install -Dm755 "${srcdir}/atmos_${pkgver}_linux_bin" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
