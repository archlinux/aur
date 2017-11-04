# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-summary
pkgver=1.1.4
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('883bdf17bc9b76db9d6b083e7bfca24fa8dfc1194646def62377016f4c26fea5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
