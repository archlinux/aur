# Maintainer: Denoos <denis at sent.com>

pkgname=kde-servicemenus-encfs
pkgver=0.5.2
pkgrel=1
pkgdesc="A KDE service menus for EncFS from dolphin"
arch=('any')
url="http://www.egregorion.net"
license=('GPL')
depends=('dolphin' 'kdialog')
source=("https://docs.google.com/uc?id=0B2KQf7Dbx7DUUVBnSDJRRVpVaFU&export=download")
md5sums=('26e9f8d37d40a49250d3b84905f88ae5')

package() {
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  install -m 644 ${srcdir}/kde-service-menu-enfs_${pkgver}archlinux/desktop/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 755 ${srcdir}/kde-service-menu-encfs_${pkgver}archlinux/bin/* ${pkgdir}/usr/bin/
}
