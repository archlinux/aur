# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-rainbow-branches
pkgver=0.1.0
pkgrel=1
pkgdesc="Rainbow printing for git branch -avv"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('74e04941d8ecdd35e4306ed9cbc32d52')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
