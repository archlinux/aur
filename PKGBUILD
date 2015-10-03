# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=kde-servicemenus-pdf
pkgver=0.6
pkgrel=3
pkgdesc="KDE (KF5) service menus for PDF documents"
arch=('any')
url="http://kde-apps.org/content/show.php/KDE+Service+Menu+PDF?content=37321"
license=('GPL')
depends=('dolphin' 'ghostscript' 'texlive-core' 'poppler' 'pdftk')
source=(http://kde-apps.org/CONTENT/content-files/37321-kde-service-menu-pdf_0.6.tar.gz)
md5sums=('ee032d4984b6eb91d77b33ed82632381')

package() {
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  install -m 644 ${srcdir}/kde-service-menu-pdf_$pkgver/desktop/*.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 755 ${srcdir}/kde-service-menu-pdf_$pkgver/bin/* ${pkgdir}/usr/bin/
}
