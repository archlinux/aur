# Maintainer: ZaneFerns360 <zane.ferns360 at gmail dot com>

pkgname=cachyos-themes-sddm-emerald
pkgver=1.0
pkgrel=1
pkgdesc="CachyOS Emerald SDDM Theme"
arch=('any')
url="https://github.com/ZaneFerns360/cachyos-sddm-emerald"
license=('CCPL:cc-by-sa')
depends=('sddm')

source=(
    "${pkgname}-${pkgver}.tar.xz::https://github.com/ZaneFerns360/cachyos-sddm-emerald/releases/download/v${pkgver}/cachyos-emerald.tar.xz"
)

sha256sums=('SKIP')

package() {
    install -d "${pkgdir}/usr/share/sddm/themes/cachyos-emerald"

    cp -r "${srcdir}/cachyos-emerald/"* \
        "${pkgdir}/usr/share/sddm/themes/cachyos-emerald/"
}

