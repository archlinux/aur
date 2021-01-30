# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=madpablo-theme
pkgname_link=madpablo-theme
pkgbase=madpablo-theme
pkgver=1
pkgrel=1
pkgdesc="GTK2 theme"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/madpablo.tar.xz')
md5sums=('91e6fe7e9e2ec2ba6569063bef8cae68')

package() {
  install -d /$pkgdir/usr/share/themes

  cp -R madpablo/ /$pkgdir/usr/share/themes/
}

