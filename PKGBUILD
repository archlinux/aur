# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=gnome-colors-icon-theme-bin
pkgname_link=gnome-colors-icon-theme-bin
pkgbase=gnome-colors-icon-theme-bin
pkgver=5.5.1
pkgrel=1
pkgdesc="Installs gnome-colors-icon-theme without any compilation and dependencies."
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=('gnome-colors-icon-theme')
makedepends=('gnome-icon-theme' 'gnome-icon-theme-symbolic')
source=('https://sourceforge.net/projects/archbangretro/files/gnome-colors-icon-theme-bin.tar.xz')
md5sums=('1e8b375e13985bfa25ab727f2f4fd268')

package() {
  install -d /$pkgdir/usr/share/icons

  cp -R $pkgname/* /$pkgdir/usr/share/icons/

}
