# maintainer: Akim Sadaoui <akim@sadaoui.eu>
pkgname=prosody-mod-csi-battery-saver
pkgver=2020.01.22
pkgrel=1
_commit="ffc64d285a96"
pkgdesc="Delay sending unimportant data to inactive devices to save power"
arch=('any')
url="http://modules.prosody.im/mod_csi_battery_saver.html"
license=('MIT')
depends=('prosody')
source=("mod_csi_battery_saver_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_csi_battery_saver/mod_csi_battery_saver.lua")
sha1sums=('b3983de32a85d7022e4b6df5d035c0587cbb1826')

package() {
  install -Dm 644 "mod_csi_battery_saver_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_csi_battery_saver.lua"
}
