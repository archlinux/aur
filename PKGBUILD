# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.19.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('a6d6c84192d138690c4db0fc0eecefc28cd1dcbe0c49cacf67e092d26b851390')
b2sums_x86_64=('9933a381344cdae083554cdf1cb153b64bb61e6f2a2472746cf5baf77076dde786035aae2069f373d0ec74c1831bdf02b9396f6c1c84a0d2d46a99223c74d578')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}