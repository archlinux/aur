# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=qdarkstudio4-theme
pkgname_link=qdarkstudio4-theme
pkgbase=qdarkstudio4-theme
pkgver=1
pkgrel=1
pkgdesc="Dark GTK2 theme"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/QDarkStudio4.tar.xz')
md5sums=('7f81b54dc7b6021de9e624b65a7188c5')

package() {
  install -d /$pkgdir/usr/share/themes

  cp -R QDarkStudio4/ /$pkgdir/usr/share/themes/
}

