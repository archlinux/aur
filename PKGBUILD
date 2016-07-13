# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.4.7
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha512sums=('780d3c3da3d1f7482010bc73948bb0a43d6b11efcb26c135ffdb78bdb9983895ab1eb99749f21d59be64feb08032eb99602c0ff3c47ec61deb56390455efc8f3')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "$pkgdir/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
