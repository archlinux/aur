# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-summary
pkgver=1.2.1
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b1900b11ad233dfd8ce0bcdcda41448bbc2edd37f7a803724467d0591574cd52')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
