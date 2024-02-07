# Maintainer: baraclese at gmail dot com
pkgname=binmerge
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool to merge multiple bin/cue tracks into one."
url="https://github.com/putnam/binmerge"
arch=('any')
license=('GPL2')
depends=(
    python
)
source=("https://github.com/putnam/binmerge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae70ca3e04d71b65e31da0e8129f3c5ec21deb86573712cef5e22334fa6018f1')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 binmerge "$pkgdir/usr/bin/binmerge"
}
