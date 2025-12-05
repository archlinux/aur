# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Jerry Y. Chen <chen@jyny.dev>


pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.38.0
pkgrel=2
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('9185c30c5c164b7ad415826c5ef5a5e7806ebc1e2f942c334aaad489c03c99f6')
b2sums_x86_64=('4d6c46e1bdfa7a1215ddcff19963a491858a1a10a5c998c395fc4674115f9f55197729a2222e31b70f50ec94e42274c241dca9a8e4c437a025a3a00a79cea650')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}
