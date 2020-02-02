# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.5.10
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha256sums=('8b71dc4c4cfc6e3ebed89db8486c830e49aec0b25989df70c02a8e98cef6240a')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "${pkgdir}/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
