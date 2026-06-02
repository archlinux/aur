# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar-bin
pkgver=0.0.6
pkgrel=1
pkgdesc='Prebuilt GTK4/Relm4 Google Calendar popup for Waybar'
arch=('x86_64')
url='https://github.com/pufanyi/waybar-google-calendar'
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
provides=("waybar-google-calendar=$pkgver")
conflicts=('waybar-google-calendar')
_source_tag="v$pkgver-$pkgrel"
source=("$pkgname-${_source_tag#v}-x86_64.tar.zst::$url/releases/download/$_source_tag/$pkgname-${_source_tag#v}-x86_64.tar.zst")
sha256sums=('7aa040826f1a7a328469306fb46e5784f59cc552f694b4c4ed0ca1171914baac')

package() {
  cp -a usr "$pkgdir/"
}
