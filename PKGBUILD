# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=huawei-me936-udev
pkgver=1.0
pkgrel=3
pkgdesc="udev Rule and Configuration files for Huawei ME936 LTE Modul"
url="https://github.com/StevenSeifried/udev-rules/tree/master/huawei-me936"
license=("GPL3")
arch=('any')
source=("git+https://github.com/StevenSeifried/udev-rules/")
sha256sums=('SKIP')
sha512sums=('SKIP')
package() {
 install -Dm644 "$srcdir/udev-rules/huawei-me936/77-huawei-me936.rules" "${pkgdir}/etc/udev/rules.d/77-huawei-me936.rules"
 install -Dm644 "$srcdir/udev-rules/huawei-me936/modules-load.d/huawei-me936.conf" "${pkgdir}/etc/modules-load.d/huawei-me936.conf"
 install -Dm644 "$srcdir/udev-rules/huawei-me936/modprobe.d/huawei-me936.conf" "${pkgdir}/etc/modprobe.d/huawei-me936.conf"
}
