# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=0.1
pkgrel=2
pkgdesc="Get apps and run in Amber-PM container"
arch=('x86_64')
# url="https://gitee.com/amber-ce/amber-pm-store/"
url="https://gitee.com/spark-store-project/apm-store"
license=('custom')
depends=('amber-package-manager' 'zenity' 'qt5-tools')

# source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://gitee.com/spark-store-project/apm-store/repository/archive/0.0.1.zip")
sha256sums=('cf0380d3fd0bf0dd871bf69818d84fb66fa3591e39d96f611b485951c2c0dff8')
install=amber-pm-store.install

package() {
#     cd "$srcdir/amber-pm-store-${pkgver}/src"
    cd "$srcdir/apm-store-0.0.1/src"
    cp -r usr "$pkgdir/"
    
}
