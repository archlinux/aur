# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=gnome-colors-common
pkgname_link=gnome-colors-common
pkgbase=gnome-colors-common
pkgver=1
pkgrel=1
pkgdesc=""
url="https://github.com/gnome-colors/gnome-colors/tree/master/gnome-colors/gnome-colors-common"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/gnome-colors-common.tar.xz')
md5sums=('508f5c82d9d585d7a69180ca9814c897')

package() {
  install -d /$pkgdir/usr/share/icons

  cp -R $pkgname /$pkgdir/usr/share/icons/

}


