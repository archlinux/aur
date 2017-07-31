# Maintainer: Bradford Smith <bradford dot smith nine four at gmail dot com>

pkgname=git-summary
pkgver=1.1.2
pkgrel=1
pkgdesc="Script to print a summary of git author contributions"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('git')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dc64a0cb1ddf57decd676a3225861f1c73a20bc920e5bf9d9b10e9eca12dd048')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}
