# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.28.0
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
source=("https://github.com/GNOME/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('07e3c8b1bdd67647084d28ac207acff369d835b98a5c5a554fc9a2ad90447533')

package() {
  cd "$_srcname-$pkgver"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro
}
