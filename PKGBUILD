# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=kde-servicemenus-pdf
pkgver=1.0
pkgrel=1
pkgdesc="A KDE service menus for PDF documents from dolphin"
arch=('any')
url="http://www.egregorion.net"
license=('GPL')
depends=('dolphin' 'kdialog' 'ghostscript' 'texlive-bin' 'poppler' 'pdftk')
source=("http://www.egregorion.net/works/kde/servicemenus/pdf/kde-service-menu-pdf_${pkgver}_all.tar.gz")
md5sums=('6bbafea44a40a85874fb361c3473ad7e')

package() {
  install -dm 755 ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 kde-service-menu-pdf_${pkgver}_all/ServiceMenus/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  
  install -dm 755 ${pkgdir}/usr/bin/
  install -m 755 kde-service-menu-pdf_${pkgver}_all/bin/* ${pkgdir}/usr/bin/
}

