# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rtl8761b-fw
pkgver=20200610
pkgrel=1
pkgdesc="Realtek bluetooth firmware for RTL8761B based devices"
arch=('any')
url="https://www.xmpow.com/pages/download"
license=('unknown')
source=(
    "https://mpow.s3-us-west-1.amazonaws.com/mpow_MPBH456AB_driver+for+Linux.tgz"
)
sha512sums=(
    'ebdf480a2e7746853b2ad1f422befcc86ec39c676147350b5440000e6e3c1e4cad3c4154c8fbdc72de86103269c336fc196b1173703767640a15d55d297928a2'
)

package() {
    cd "$srcdir/20200610_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt"

    install -Dm644 rtl8761b_fw "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"
    install -Dm644 rtl8761b_config "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_config.bin"
}
