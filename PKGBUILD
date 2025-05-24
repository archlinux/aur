# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec-bin"
pkgver=0.2.2.0
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux"
arch=("x86_64")
url="https://github.com/Rehpotsirhc-z/dec"
license=("GPL-3.0-or-later")
depends=("paru")
provides=("dec")
conflicts=("dec-git")
source=("https://github.com/Rehpotsirhc-z/dec/releases/download/v${pkgver}/dec-${pkgver}-x86_64.tar.gz"
  "https://raw.githubusercontent.com/Rehpotsirhc-z/dec/refs/tags/v${pkgver}/LICENSES/GPL-3.0-or-later.txt")
sha256sums=("495073e5aeb7c0532b540ec58846834d6d0d7cebe42ce4fafe24fe03d7032d88"
  "fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0")

package() {
  install -Dm644 "GPL-3.0-or-later.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "dec" "${pkgdir}/usr/bin/dec"
}
