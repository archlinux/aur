# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-rainbow-branches
pkgver=0.1.2
pkgrel=1
pkgdesc="Rainbow printing for git branch -avv"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5298438641e39311e4cc8a896f753385e279beff2eca37f6227a731664c2012a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
