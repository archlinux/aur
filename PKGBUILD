# Maintainer: Denoos <denis at sent.com>

pkgname=kde-service-menu-encfs
pkgver=0.8
pkgrel=1  
pkgdesc="A KDE service menus for EncFS from dolphin. KF5 version."
arch=('any')
url="http://www.egregorion.net"
license=('GPL')
depends=('dolphin' 'kdialog')
source=("https://www.egregorion.net/works/kde/servicemenus/encfs/${pkgname}-${pkgver}_all.tar.gz")
md5sums=('e20a76ae2ac5e64c757027a851ae2cc7')

package() {
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 ${srcdir}/${pkgname}-${pkgver}_all/ServiceMenus/encfs.desktop   ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 ${srcdir}/${pkgname}-${pkgver}_all/doc/*                        ${pkgdir}/usr/share/doc/${pkgname}
  install -m 755 ${srcdir}/${pkgname}-${pkgver}_all/bin/encfs-kdialog            ${pkgdir}/usr/bin/
}
