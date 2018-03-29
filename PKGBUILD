# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-summary
pkgver=1.2.0
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5cb3ac0ac78b8852cd1abe29817fe8d2d6b746f9896faad4c2b4500c5044334d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
