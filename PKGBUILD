# Maintainer: Jeffrey Lin <anaveragehuman.0 at gmail dot com>
pkgname=ttf-ibm-vga8
pkgver=1.0
pkgrel=1
pkgdesc="A TrueType Font for Codepage 437, the default font used in TTYs."
arch=('any')
url="http://int10h.org/oldschool-pc-fonts/"
license=('ccpl')
optdepends=('fontconfig: configure and customize font access'
            'xorg-font-utils: transitional package depending on xorg font utilities')
install=$pkgname.install
source=("http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.0.zip")
sha256sums=('7666cf23176e34ea03a218b5c1500f4ad729d97150ab7bdb7cf2adf4c99a9a7a')

package() {
    install -Dm644 "PxPlus (TrueType - extended charset)/PxPlus_IBM_VGA8.ttf" \
        "$pkgdir/usr/share/fonts/TTF/PxPlus IBM VGA8.ttf"
}
