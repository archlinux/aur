# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-bin"
pkgver=0.2.1.0
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://gitlab.com/rehposuite/dec"
license=("GPL")
depends=("paru")
provides=("dec")
source=("https://gitlab.com/rehposuite/dec/-/raw/2ab46279d112e3d170a75ba9f2a60ad808dc6182/bin/dec-0.2.1.0-x86_64"
        "https://gitlab.com/rehposuite/dec/-/raw/main/LICENSE")
sha256sums=("309589e61de3fda6a2d92b6bb4654fdda803a7042d5c5a32c2da9f08769f4a32"
            "cc4f824f8326882956af8fdded810b3aa7a5912913b926e23ebd3272406cab11")

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "dec-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dec"
}
