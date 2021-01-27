# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=archbey
pkgname_link=archbey
pkgbase=archbey
pkgver=1
pkgrel=1
pkgdesc="Displays arch linux logo with resources metrics"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/archbey.tar.xz')
md5sums=('9665bcf04053ca6f8482dd01dc64c51e')

package() {
  install -d /$pkgdir/usr/bin/

  cp -R $pkgname/archbey /$pkgdir/usr/bin/
}
