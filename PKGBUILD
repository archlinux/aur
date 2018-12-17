# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=fdlinecombine
pkgver=0.4
pkgrel=1
pkgdesc="Read multiple fds and print data to stdout linewise"
arch=(x86_64)
url=https://github.com/vi/fdlinecombine
license=(unknown)
depends=()
source=(https://github.com/vi/$pkgname/archive/v$pkgver.tar.gz)
sha1sums=('b180d707db34d7030e51051271be4501c6bf6bdd')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 README.md "$pkgdir/usr/share/doc/fdlinecombine/README.md"
}
