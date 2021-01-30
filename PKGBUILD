# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=shiki-statler-theme
pkgname_link=shiki-statler-theme
pkgbase=shiki-statler-theme
pkgver=1
pkgrel=1
pkgdesc="GTK2 theme"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/Shiki-Statler.tar.xz')
md5sums=('98ce6f2e0e3588107f6dc6330ed524b5')

package() {
  install -d /$pkgdir/usr/share/themes

  cp -R Shiki-Statler/ /$pkgdir/usr/share/themes/
}


