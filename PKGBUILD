# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.28.0
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
source=("https://gitlab.gnome.org/GNOME/$_srcname/-/archive/$pkgver/$_srcname-$pkgver.tar.bz2")
sha256sums=('56c80b960d7000ebefc22c20187b887b2a5959fc37afe20e214c40f5a0ee8dfb')

package() {
  cd "$_srcname-$pkgver"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro
}
