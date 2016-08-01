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
sha512sums=('16a056a0a26f0d3d4937b4a5591d9528a1633d7a95d37e02a096b09691d15ba49e252b5ceea17630551643cba014fa55397706eb2866b52b70cf6c722da14180')

package() {
    install -d "${pkgdir}/usr/share/webapps"
    cp -a "InvoicePlane-${pkgver}" "$pkgdir/usr/share/webapps/invoiceplane"
    install -Dm644 "InvoicePlane-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
