#Maintainer: ente <mail@ck76.de>

pkgname=icc-x360-qhd
pkgver=1.0.0
pkgrel=0
pkgdesc="An ICC profile for the HP Spectre x360 with QHD screen (created on a Spectre x360 4231 using a colormunki Display colorimeter)"
url="https://wiki.archlinux.org/index.php/HP_Spectre_x360_4231"
arch=('any')
license=('public domain')
provides=('icc-x360-qhd')
source=('git+https://github.com/ente76/icc-x360-qhd.git')
md5sums=('SKIP')

package() {
  msg "profiles are stored in /var/lib/colord/icc"
  msg "you must activate it manually in your system settings"
  install -d "${pkgdir}"/var/lib/colord/icc
  install -m644 */*.icc "${pkgdir}"/var/lib/colord/icc
}