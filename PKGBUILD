# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar-bin
pkgver=0.0.4
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
sha256sums=('dabf0baf93c287ca5992006411a054c47dc84ea9920744ffc97555d5f07358e9')

package() {
  cp -a usr "$pkgdir/"
}
