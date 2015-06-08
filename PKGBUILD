# Contributor: Alexander Preisinger <alexander dot preisinger at gmail dot com>
pkgname=apbp
pkgver=1.2
pkgrel=2
pkgdesc="Simple backup script."
arch=(any)
license=('GPL')
depends=('python')
source=(apbp.py)
url="https://sourceforge.net/users/giselher"
md5sums=('3429fb06cc175c0e831f5a004fdf4b0d')

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp apbp.py ${pkgdir}/usr/bin/apbp
}
