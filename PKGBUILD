# maintainer: Akim Sadaoui <akim@sadaoui.eu>
pkgname=prosody-mod-csi-battery-saver
pkgver=2021.02.24
pkgrel=1
_commit="6d595857164a"
pkgdesc="Delay sending unimportant data to inactive devices to save power"
arch=('any')
url="http://modules.prosody.im/mod_csi_battery_saver.html"
license=('MIT')
depends=('prosody')
source=("mod_csi_battery_saver_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_csi_battery_saver/mod_csi_battery_saver.lua")
sha1sums=('e2a4fb68234a23d41cc180afb6025738e313ceee')

package() {
  install -Dm 644 "mod_csi_battery_saver_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_csi_battery_saver.lua"
}
