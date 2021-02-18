# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=material-black-colors-theme
pkgname_link=material-black-colors-theme
pkgbase=material-black-colors-theme
pkgver=1
pkgrel=1
pkgdesc="GTK2/3 themes"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/material-black-colors-theme.zip/download')
md5sums=('1c7d93b4dd4b4b442a42284a401bcecc')

package() {
  install -d /$pkgdir/usr/share/themes

  cp -R $pkgname/* /$pkgdir/usr/share/themes/
}

