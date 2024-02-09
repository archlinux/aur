# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=gnome-shell-extension-quick-settings-audio-panel
pkgver=39
pkgrel=1
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL3')
_uuid=quick-settings-audio-panel@rayzeq.github.io
source=($url/releases/download/v$pkgver/$_uuid.shell-extension.zip)
sha256sums=('be35c4266e01cfe027bc71c0a9315983956a377db6567399434baf00fcc3c2e3')
depends=('gnome-shell')

package() {
  local extdir=$pkgdir/usr/share/gnome-shell/extensions/$_uuid

  install -d $extdir
  bsdtar -xf $_uuid.shell-extension.zip -C $extdir
}
