# Maintainer: HAHWUL <hahwul@gmail.com>
pkgname=eoyc
pkgver=0.3.0
pkgrel=2
pkgdesc="Endless Options, Your Chain - chainable string encoding/decoding CLI written in Crystal."
arch=('x86_64')
url="https://github.com/hahwul/eoyc"
license=('MIT')
source=(
  "eoyc-${pkgver}::https://github.com/hahwul/eoyc/releases/download/v${pkgver}/eoyc-v${pkgver}-linux-x86_64"
  "LICENSE-eoyc-${pkgver}::https://raw.githubusercontent.com/hahwul/eoyc/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/eoyc-${pkgver}" "${pkgdir}/usr/bin/eoyc"
  install -Dm644 "${srcdir}/LICENSE-eoyc-${pkgver}" "${pkgdir}/usr/share/licenses/eoyc/LICENSE"
}
