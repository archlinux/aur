# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=atmos-bin
pkgver=1.205.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
b2sums=('4a1e5472dfd993d3c18009e27f4a89da34297537b6a19aa0bb04ebaccec2c36ea86084756bc6dc9d037ac10e72c8dd98ccd283413ab3bda348066d7516b29847')
sha512sums=('104da8bf0c78e734a4c5257013735174a9a2cf22f671143c76dd25e83e0ad820e3673d8adbb67e6d0ac5df99e6c6f1a7e49dccf6f6057aef06dfc42bcf27893a')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
