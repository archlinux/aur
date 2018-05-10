# Maintainer: Marco Cameriero <aur@marcocameriero.net>
pkgname=hedit-bin
pkgver=0.1
pkgrel=1
pkgdesc="A VIM-like terminal-based hex editor scriptable with JS."
arch=('x86_64')
url="https://github.com/95ulisse/hedit"
license=('MIT')
depends=('libtermkey' 'unibilium')
source_x86_64=("https://github.com/95ulisse/hedit/releases/download/v${pkgver}/hedit-${pkgver}-bin.tar.gz")
sha256sums_x86_64=('fd8824324b158afa241ffa39017e8c6d6790a093c8e73de704c7b148aaa6b580')

package() {
    cd "$srcdir"
    install -Dm755 "hedit" "$pkgdir/usr/bin/hedit"
}
