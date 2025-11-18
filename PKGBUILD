# Maintainer: AquaCheese <aquacheese.yt@gmail.com>
pkgname=orphanrm
pkgver=1.0.0
pkgrel=1
pkgdesc="Scan for and remove orphaned packages on Arch Linux"
arch=('any')
url="https://github.com/AquaCheese/orphanrm"
license=('MIT')
depends=('pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AquaCheese/orphanrm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d340fae727735f927a32bc14e2d65cc51c077bfa6e5527bb8d194f788387151')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the script
    install -Dm755 orphanrm "$pkgdir/usr/bin/orphanrm"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
