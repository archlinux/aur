# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="proid-bin"
pkgver=0.6.1.0
pkgrel=1
pkgdesc="A tool to hide and show windows in X"
arch=("x86_64")
url="https://github.com/Rehpotsirhc-z/proid"
license=("GPL-3.0-or-later")
depends=("xdotool")
provides=("proid")
conflicts=("proid-git")
source=("https://github.com/Rehpotsirhc-z/proid/releases/download/v${pkgver}/proid-${pkgver}-x86_64.tar.gz"
  "https://raw.githubusercontent.com/Rehpotsirhc-z/proid/refs/tags/v${pkgver}/LICENSES/GPL-3.0-or-later.txt")
sha256sums=("d062a615bf537ecadb51c6c8af0825340c48e0041a9354fb9d9bd43c8e91dcc9"
  "fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0")

package() {
  install -Dm644 "GPL-3.0-or-later.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "proid" "${pkgdir}/usr/bin/proid"
}
