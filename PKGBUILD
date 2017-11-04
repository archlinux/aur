# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=git-summary
pkgver=1.1.3
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e7c35b44adea1b951cabe75a324832518e430593d0f7e8bf5e3ceba3924079b6')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
