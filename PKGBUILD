# Maintainer: Tiago Cardoso <tbcardoso at outlook dot com>

pkgname=evans-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='More expressive universal gRPC client'
arch=('x86_64')
url='https://github.com/ktr0731/evans'
license=('MIT')
provides=('evans')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ktr0731/evans/releases/download/${pkgver}/evans_linux_amd64.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ktr0731/evans/v${pkgver}/LICENSE")
sha256sums=('eee0e493c326c39b0336e0ed9249cc8778a129c7b0a9db867b3435be97ed80f7'
            '1456fe7612f76bde2b443157a0755e31c31ef16f032e74328e64883a3402e46f')

package() {
  install -Dm0644 "${srcdir}"/"${pkgname}-${pkgver}-LICENSE" "${pkgdir}"/usr/share/licenses/evans/LICENSE
  install -Dm0755 "${srcdir}"/evans "${pkgdir}"/usr/bin/evans
}
