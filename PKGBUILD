# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.4.8
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha512sums=('572a99f9c1932eb4fb21802f5941c9fd67bb821ea1b8afc9635236a99463e25ce7094883959af8b718ae4cd26e464c718763e428d1c62bda7da38215747de83c')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "$pkgdir/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
