# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=0.1
pkgrel=4
pkgdesc="Get apps and run in Amber-PM container"
arch=('x86_64')
# url="https://gitee.com/amber-ce/amber-pm-store/"
url="https://gitee.com/spark-store-project/apm-store"
license=('custom')
depends=('amber-package-manager' 'zenity' 'qt5-tools')

# source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://gitee.com/spark-store-project/apm-store/repository/archive/0.0.3.zip")
sha256sums=('b447058f8cfb069a2ff3ebb76ade00b43bed124b582d1055c369d11c1d34536d')
install=amber-pm-store.install

package() {
#     cd "$srcdir/amber-pm-store-${pkgver}/src"
    cd "$srcdir/apm-store-0.0.3/src"
    cp -r usr "$pkgdir/"
    
}
