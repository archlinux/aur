# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.4.9
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha512sums=('02919d178298a9acbfb9562ebb6bd2f8dc0fa295fb7063a8e4955be96454f97be95417a58d29f2826840e235e86239cd2d22671ad6b347b0ebbb9953df51ca4f')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "$pkgdir/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
