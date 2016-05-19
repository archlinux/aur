# Maintainer:       RedTide
# Original authors: Thayer Williams and Allan McRae

pkgname=archlinux-lxdm-theme-full
pkgver=0.1
pkgrel=1
pkgdesc="Arch Linux GTK2/3 theme for LXDM"
arch=('any')
url="https://github.com/redtide/lxdm-theme-archlinux/"
install=archlinux-lxdm-theme-full.install
license=('CCPL:by-sa')
depends=('lxdm')
source=("git://github.com/redtide/lxdm-theme-archlinux.git")
md5sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/lxdm/themes/Archlinux"
  cp -r $srcdir/lxdm-theme-archlinux/Archlinux "$pkgdir/usr/share/lxdm/themes"
}
