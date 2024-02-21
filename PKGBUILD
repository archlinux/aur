# Maintainer: Sebastian Kremiec <sebastian.kremiec at gmail dot com>
pkgname=gnome-shell-extension-quick-settings-audio-panel
pkgver=44
pkgrel=2
pkgdesc='Quick Settings Audio Panel GNOME Extension'
arch=('any')
url=https://github.com/Rayzeq/quick-settings-audio-panel
license=('GPL3')
_uuid=quick-settings-audio-panel@rayzeq.github.io
source=("$pkgname-v$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
sha256sums=('f123b22b90ddd604832cd60daa754f84f0f8f5a29445e377f875786b0228ef75')
depends=('gnome-shell')

package() {
  local extdir=$pkgdir/usr/share/gnome-shell/extensions/$_uuid

  install -d $extdir
  bsdtar -xf $pkgname-v$pkgver.zip -C $extdir
}
