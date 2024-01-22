# Maintainer: Carson Rueter <swurl at swurl dot x y z>
pkgname='choreo-bin'
pkgver="v2024.1.2"
_pkgver="v2024.1.2-b" #???
pkgrel=1
pkgdesc="Time-optimized trajectory planner for FRC"
arch=("x86_64")
url="https://github.com/SleipnirGroup/Choreo"
license=('BSD')
provides=("choreo")
depends=("webkit2gtk")
source=("$pkgname-$pkgver.deb::https://github.com/SleipnirGroup/Choreo/releases/download/$_pkgver/Choreo-$pkgver-Linux-x86_64.deb")
sha256sums=('e430d33e2f718673434d8b1db0495bb8ede365b660f1e7d574fd7a5f4783148c')

package() {
    cd $srcdir
    ar x $pkgname-$pkgver.deb
    tar xf data.tar.gz -C $pkgdir
}
