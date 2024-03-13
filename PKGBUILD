# Maintainer: baraclese at gmail dot com
pkgname=binmerge
pkgver=1.0.3
pkgrel=1
pkgdesc="Tool to merge multiple bin/cue tracks into one."
url="https://github.com/putnam/binmerge"
arch=('any')
license=('GPL2')
depends=(
    python
)
source=("https://github.com/putnam/binmerge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a5e19c04790c26ec8a577310ae1a1726a4abf34029d6278bdfe4fde801b136a0')

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 binmerge "$pkgdir/usr/bin/binmerge"
}
