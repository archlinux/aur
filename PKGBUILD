# Maintainer: Anysets <anysets@qq.com>

pkgname=amber-pm-store
pkgver=0.1
pkgrel=1
pkgdesc="Get apps and run in Amber-PM container"
arch=('x86_64')
url="https://gitee.com/amber-ce/amber-pm-store/"
license=('custom')
depends=('amber-package-manager')

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
sha256sums=('3b487400db675c684ec6568ea50136f3bb3d98163e727ae8135f798c87930f4f')


package() {
    cd "$srcdir/amber-pm-store-${pkgver}/src"
    
    cp -r usr "$pkgdir/"
    
}
