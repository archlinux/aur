# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.5.7
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha256sums=('151e4cb6d7b0ac1d060876497f10017e305cabdc0a7de1df2abe1ffeee7df45a')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "${pkgdir}/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
