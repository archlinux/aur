# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-bin"
pkgver=0.2.0.0
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://gitlab.com/rehposuite/dec"
license=("GPL")
depends=("paru")
provides=("dec")
source=("git+${url}.git")
sha256sums=("SKIP")

package() {
  cd "dec"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "bin/dec-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dec"
}
