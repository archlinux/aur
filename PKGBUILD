# Maintainer: Cyuria <cyuria.dev@gmail.com>

pkgname=awman2
pkgver="0.1"
pkgrel=1
pkgdesc="Parse the arch wiki offline as man pages"
arch=(any)
url="https://github.com/cyuria/$pkgname"
license=(BSD-2-Clause)
depends=(arch-wiki-docs
         bash
         grep
         man
         pandoc)
source=("https://github.com/cyuria/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1882bdc0d43a84bd1bdacce3483c8caf285ba71746db158d39e00744b4797e60')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/wiki" "$pkgdir/usr/bin/wiki"
    install -Dm644 "$srcdir/$pkgname-$pkgver/license" "$pkgdir/usr/share/licenses/awman2/license"
    install -Dm644 "$srcdir/$pkgname-$pkgver/wiki.1" "$pkgdir/usr/share/man/man1/wiki.1"
}
