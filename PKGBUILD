# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rtl8761b-fw
pkgver=20200816
pkgrel=1
pkgdesc="Realtek bluetooth firmware for RTL8761B based devices"
arch=('any')
url="https://github.com/Realtek-OpenSource/android_hardware_realtek"
license=('unknown')
source=("https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_fw")
sha512sums=('53f6cac0f001cbcb2fe461d00a8d5f68bdb28a620251954f4c3e5036a61a8aae23b863b31cbaed4233cf4e94b558ccd4ee8f965eeab43101406dc3646dc2be43')

package() {
  install -Dm644 rtl8761b_fw "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"
}
