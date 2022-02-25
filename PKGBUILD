# Maintainer: Rahul Menon <rmeno12 at utexas dot edu>

pkgname=yay-cache-cleanup-hook
pkgver=1.0
pkgrel=1
pkgdesc='Pacman hook to clean up both pacman and yay caches'
arch=(any)
url="https://github.com/rmeno12/yay-cache-cleanup-hook"
license=('MIT')
depends=(pacman-contrib jq yay)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b213a047ad601c024d1b817522a97a23824a7cc454cc2012f5116cff20f84f46')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 yay-cache-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/yay-cache-cleanup.hook"
}
