# Maintainer: Bradford Smith <bradford dot smith nine four at gmail dot com>

pkgname=git-summary
pkgver=1.1.1
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('da716a211daea66ff62537d4187f852efc237d696b04e37812beb33074ad3cea')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
