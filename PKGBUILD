# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.5.8
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha256sums=('b1fa56765c490a0a8c21db12bc7f9d36f8f8133751ad01abde280dc102a48a49')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "${pkgdir}/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
