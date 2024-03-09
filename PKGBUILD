# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-bin"
pkgver=0.2.0.0
pkgrel=2
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://gitlab.com/rehposuite/dec"
license=("GPL")
depends=("paru")
provides=("dec")
source=("https://gitlab.com/rehposuite/dec/-/raw/49d2d3b298b0d339bc6acebf6449842d3cb74e5b/bin/dec-0.2.0.0-x86_64"
        "https://gitlab.com/rehposuite/dec/-/raw/main/LICENSE")
sha256sums=("2aebffcb1ba492d1768e9fdd2817aeab34de0977f4a4eb0bf4d8c242cafba064"
            "cc4f824f8326882956af8fdded810b3aa7a5912913b926e23ebd3272406cab11")

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "dec-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dec"
}
