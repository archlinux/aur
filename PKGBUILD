# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.30.0
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
license=('GPL3')
url='https://wiki.gnome.org/Apps/Games'
# libretro-cores is export-ignore in .gitattributes
source=("git+https://gitlab.gnome.org/GNOME/$_srcname.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$_srcname"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro
}
