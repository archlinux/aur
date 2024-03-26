# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=gnome-shell-extension-quick-settings-audio-panel
pkgver=46
pkgrel=1
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL3')
_uuid=quick-settings-audio-panel@rayzeq.github.io
source=("$pkgname-v$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
sha256sums=('e897c6f4f18cb51911c1e4874438424962aa490802712a504f7facdf897e6169')
depends=('gnome-shell')

package() {
  local extdir=$pkgdir/usr/share/gnome-shell/extensions/$_uuid

  install -d $extdir
  bsdtar -xf $pkgname-v$pkgver.zip -C $extdir
}
