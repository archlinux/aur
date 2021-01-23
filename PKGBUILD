# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=batti-icons
pkgname_link=batti-icons
pkgbase=batti-icons
pkgver=1
pkgrel=1
pkgdesc="svg and png icons from batti software"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname 'batti')
makedepends=('hicolor-icon-theme')
source=('https://sourceforge.net/projects/archbangretro/files/batti-icons.tar.xz')
md5sums=('0b657bea3ee85d055e7118a5e97b5c49')

package() {
  install -d /$pkgdir/usr/share/icons/hicolor
  install -d /$pkgdir/usr/share/icons/hicolor/16x16
  install -d /$pkgdir/usr/share/icons/hicolor/16x16/actions
  install -d /$pkgdir/usr/share/icons/hicolor/16x16/apps
  install -d /$pkgdir/usr/share/icons/hicolor/22x22
  install -d /$pkgdir/usr/share/icons/hicolor/22x22/actions
  install -d /$pkgdir/usr/share/icons/hicolor/22x22/apps
  install -d /$pkgdir/usr/share/icons/hicolor/24x24
  install -d /$pkgdir/usr/share/icons/hicolor/24x24/actions
  install -d /$pkgdir/usr/share/icons/hicolor/24x24/apps
  install -d /$pkgdir/usr/share/icons/hicolor/32x32
  install -d /$pkgdir/usr/share/icons/hicolor/32x32/actions
  install -d /$pkgdir/usr/share/icons/hicolor/32x32/apps
  install -d /$pkgdir/usr/share/icons/hicolor/48x48
  install -d /$pkgdir/usr/share/icons/hicolor/48x48/actions
  install -d /$pkgdir/usr/share/icons/hicolor/48x48/apps
  install -d /$pkgdir/usr/share/icons/hicolor/scalable
  install -d /$pkgdir/usr/share/icons/hicolor/scalable/actions
  install -d /$pkgdir/usr/share/icons/hicolor/scalable/apps

  cp -R $pkgname/* $pkgdir 

}
