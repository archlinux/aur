# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=0.1
pkgrel=3
pkgdesc="Get apps and run in Amber-PM container"
arch=('x86_64')
# url="https://gitee.com/amber-ce/amber-pm-store/"
url="https://gitee.com/spark-store-project/apm-store"
license=('custom')
depends=('amber-package-manager' 'zenity' 'qt5-tools')

# source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://gitee.com/spark-store-project/apm-store/repository/archive/0.0.2.zip")
sha256sums=('47254d237c82c0a256d2a4212a08a6d3f6ce7275720ad51b99773d2fb2b6aa10')
install=amber-pm-store.install

package() {
#     cd "$srcdir/amber-pm-store-${pkgver}/src"
    cd "$srcdir/apm-store-0.0.2/src"
    cp -r usr "$pkgdir/"
    
}
