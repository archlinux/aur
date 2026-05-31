# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar-bin
pkgver=0.0.3
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
sha256sums=('625bd6d1b88630deec9535148db8608086a192c7b42690498bfe905fa527d4eb')

package() {
  cp -a usr "$pkgdir/"
}
