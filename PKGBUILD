# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.5.2
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}::https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha256sums=('05b60fb13133c96aa16517f378a2284dad777d9b3539b8226f5c4e17e379459f')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "${pkgdir}/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
