# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=gnome-carbonate
pkgname_link=gnome-carbonate
pkgbase=gnome-carbonate
pkgver=1
pkgrel=1
pkgdesc=""
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('gnome-colors-common')
source=('https://sourceforge.net/projects/archbangretro/files/gnome-carbonate.tar.xz')
md5sums=('955f7d0825496b87add28b37ad9be3a5')

package() {
  install -d /$pkgdir/usr/share/icons

  cp -R $pkgname /$pkgdir/usr/share/icons/

}

