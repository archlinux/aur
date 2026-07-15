# Maintainer: Selby Mashiki mashikiselby@gmail.com
pkgname=pkgstory
pkgver=0.3.0
pkgrel=1
pkgdesc="Your Arch Linux journey, told through pacman.log"
arch=('any')
url="https://github.com/Kolgrim33/pkgstory"
license=('MIT')
depends=('python' 'python-rich')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kolgrim33/$pkgname/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-master"
    install -Dm755 pkgstory.py "$pkgdir/usr/bin/pkgstory"
}
