# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="proid-bin"
pkgver=0.6.0.0
pkgrel=1
pkgdesc="A tool to hide and show windows in X"
arch=("x86_64")
url="https://gitlab.com/rehposuite/proid"
license=("GPL")
depends=("xdotool")
provides=("proid")
source=("https://gitlab.com/rehposuite/proid/-/raw/main/bin/proid-0.6.0.0-x86_64"
        "https://gitlab.com/rehposuite/proid/-/raw/main/LICENSE")
sha256sums=("e5cdc0e2288e73d5c09ae31704d986155b644ecd5921013cf62b2ca4fa99d84b"
            "315233e71016e53ba108f5183187a8e50aad10957f71d4e328e77eaa9988ff5e")

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "proid-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proid"
}
