# Maintainer: andrew-ld <andrew-ld at protonmail dot com>

pkgname=rtl8761b-firmware
pkgver=162105963
pkgrel=1
pkgdesc="old firmware for rtl8761b, new firmware have stability problems when used with xbox controller"
arch=('any')
url="https://github.com/andrew-ld/rtl8761b-firmware"
license=('custom')
depends=('linux-firmware')
source=(
    "LICENSE"
    "rtl8761b_config.bin"
    "rtl8761b_fw.bin"
    "rtl8761bu_config.bin"
    "rtl8761bu_fw.bin"
)
md5sums=(
    '673efaa2188a637ba065de22c9fd4c0b'
    '783db7913e59ab81adb335684d5f83fb'
    '973aa8ee84131d91a0475d8ce7fc680c'
    '49951f548b87ea0258d128195ef6e0cf'
    '6c3929e6a1d35f4206a8e9f763faf17e'
)

package() {
    install -D -m644 "rtl8761b_config.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_config.bin"
    install -D -m644 "rtl8761b_fw.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"
    install -D -m644 "rtl8761bu_config.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761bu_config.bin"
    install -D -m644 "rtl8761bu_fw.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761bu_fw.bin"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
