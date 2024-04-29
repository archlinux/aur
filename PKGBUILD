# Maintainer: Martin Filion <mordillo98@gmail.com>
# Modified: 2024-04-29  Martin Filion <mordillo98@gmail.com>
pkgname=archbey
pkgname_link=archbey
pkgbase=archbey
pkgver=1
pkgrel=2
pkgdesc="Displays arch linux logo with resources metrics"
url="https://sourceforge.net/projects/archbangretro/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
source=('https://sourceforge.net/projects/archbangretro/files/archbey.tar.xz')
md5sums=('5430b63887603198a78fcc52ee1dc553')

package() {
  install -d /$pkgdir/usr/bin/

  cp -R $pkgname/archbey /$pkgdir/usr/bin/
}
