# Maintainer: redtide <redtid3@gmail.com>
# Original authors: Thayer Williams and Allan McRae

_pkgname=lxdm-theme-archlinux
pkgname=archlinux-lxdm-theme-full
pkgver=0.1.0
pkgrel=1
pkgdesc="Arch Linux GTK2/3 theme for LXDM"
arch=(any)
url="https://github.com/redtide/lxdm-theme-archlinux"
install=archlinux-lxdm-theme-full.install
license=(CCPL:by-sa)
source=("$_pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4776d8e036bf36f3ca16fa450bfe83ee71ef0ea6e8d66870514744e875859e1b8835784eedae37b81cf86fb6513bebe46dd42955dc687e25bc8e57457f92b8b3')
b2sums=('1399de6763c28366aaf1bb787bde7a5e85f4d15bc0614e2bc244edcc78703cfb8d523cf64b5272a7d5e495ca16e63f35fbdea4b4e0a6ecec1eaa1435d95da0bc')

package() {
  install -d "$pkgdir/usr/share/lxdm/themes/Archlinux"
  cp -r "$srcdir/$_pkgname-$pkgver/Archlinux" "$pkgdir/usr/share/lxdm/themes"
}
