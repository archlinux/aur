# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar-bin
pkgver=0.0.1
pkgrel=4
pkgdesc='Prebuilt GTK4/Relm4 Google Calendar popup for Waybar'
arch=('x86_64')
url='https://github.com/pufanyi/waybar-google-calendar'
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
provides=("waybar-google-calendar=$pkgver")
conflicts=('waybar-google-calendar')
_source_tag="v$pkgver-$pkgrel"
source=("$pkgname-${_source_tag#v}-x86_64.tar.zst::$url/releases/download/$_source_tag/$pkgname-${_source_tag#v}-x86_64.tar.zst")
sha256sums=('76e84322b27fea64e3d4fd167cb75cddf21b2e449a056d0dc04a85b81e2c6443')

package() {
  cp -a usr "$pkgdir/"
}
