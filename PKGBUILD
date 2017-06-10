# Maintainer: Denoos <denis at sent.com>

pkgname=kde-service-menu-encfs
pkgver=0.5.2
pkgrel=2
pkgdesc="A KDE service menus for EncFS from dolphin. KF5 version."
arch=('any')
url="http://www.egregorion.net"
license=('GPL')
depends=('dolphin' 'kdialog')
source=("https://github.com/denoos/kde-service-menu-encfs/archive/v${pkgver}.tar.gz")
md5sums=('201ee55fcdd8d701b00a42ee04c4222b')

package() {
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  install -m 644 ${srcdir}/kde-service-menu-encfs-${pkgver}/desktop/encfs.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 755 ${srcdir}/kde-service-menu-encfs-${pkgver}/bin/kde-service-menu-encfs.sh ${pkgdir}/usr/bin/
}
