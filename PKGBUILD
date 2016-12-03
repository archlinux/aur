# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Witit Sujjapong <switit@gmail.com>

pkgname=invoiceplane
pkgver=1.4.10
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=('any')
url="https://invoiceplane.com/"
license=('MIT')
depends=('php')
#optdepends=('php-mysql: for MySQL database support')
source=("https://github.com/InvoicePlane/InvoicePlane/archive/v${pkgver}.tar.gz")
sha512sums=('43fa2a56c1ff47deeb0bc064e362f0c0fe9c93b17a51d54a7612bce6b65c919f95082e8876948cb377325a4ac6cb92416e857b56a0e39bf2910098dd76ca058d')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "$pkgdir/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
