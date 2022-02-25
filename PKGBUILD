# Maintainer: Rahul Menon <rmeno12 at utexas dot edu>

pkgname=yay-cache-cleanup-hook
pkgver=1.0.1
pkgrel=1
pkgdesc='Pacman hook to clean up both pacman and yay caches'
arch=(any)
url="https://github.com/rmeno12/yay-cache-cleanup-hook"
license=('MIT')
depends=(pacman-contrib jq yay)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f8b0f0206e73e1a9e7398ae9350ae0127dad5bae619867479fc11e37d6da302')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 yay-cache-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/yay-cache-cleanup.hook"
}
