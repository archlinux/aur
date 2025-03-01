# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-rainbow-branches
pkgver=0.2.0
pkgrel=1
pkgdesc="Rainbow printing for git branch -avv"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c26c79f19f7e54007855c2bd0a3ee5c21b5bb02df717e51ed8ed4062437353bc')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
