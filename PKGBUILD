# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-rainbow-branches
pkgver=0.1.1
pkgrel=1
pkgdesc="Rainbow printing for git branch -avv"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2df075a772e78332d84c95af97644d9d99240db9bcd2ba778ad40151ae47694d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
