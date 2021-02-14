# Maintainer: DuckSoft <realducksoft@gmail.com>
pkgname=bluez-systemd-noavrcp-git
pkgver=1
pkgrel=1
pkgdesc="systemd drop-in configuration to disable bluetooth avrcp plugin"
arch=(any)
license=('GPL')
depends=(bluez)
source=(99-noavrcp.conf)
b2sums=('8c67ad76f85484575563dc52d21798366eece08fb39c02d470c64665dd6c11a3703b51d2b8425f25774d96e4adb3914c1598c8fa1a7a39619c8fc2f87d0f1f30')

package() {
    install -Dm644 99-noavrcp.conf -t $pkgdir/etc/systemd/system/bluetooth.service.d/
}
