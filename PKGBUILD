# Maintainer: baraclese at gmail dot com
pkgname=binmerge
pkgver=1.0.1
pkgrel=3
pkgdesc="Tool to merge multiple bin/cue tracks into one."
url="https://github.com/putnam/binmerge"
arch=('any')
license=('GPL2')
depends=(
    python
)
source=("https://github.com/putnam/binmerge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('37a06f6a01e7ace0b6fd37090b7c867ffc139eef43dded21a9aca2257d30b741')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 binmerge "$pkgdir/usr/bin/binmerge"
}
