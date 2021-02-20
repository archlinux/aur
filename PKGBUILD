# Maintainer: Tiago Cardoso <tbcardoso at outlook dot com>

pkgname=evans-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='More expressive universal gRPC client'
arch=('x86_64')
url='https://github.com/ktr0731/evans'
license=('MIT')
provides=('evans')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ktr0731/evans/releases/download/${pkgver}/evans_linux_amd64.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ktr0731/evans/v${pkgver}/LICENSE")
sha256sums=('166404aab42cceee41b15a47f4f94b4d8725d689293743f767eb1bfc98d971d0'
            '1456fe7612f76bde2b443157a0755e31c31ef16f032e74328e64883a3402e46f')

package() {
  install -Dm0644 "${srcdir}"/"${pkgname}-${pkgver}-LICENSE" "${pkgdir}"/usr/share/licenses/evans/LICENSE
  install -Dm0755 "${srcdir}"/evans "${pkgdir}"/usr/bin/evans
}
