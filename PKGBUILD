# Maintainer: tsuniko <cuzimmrdna@gamil.com>
pkgname=osu-fetch-bin
pkgver=1.2
pkgrel=2
pkgdesc="fastfetch-like stats printing for osu!"
arch=('x86_64')
conflicts=('osufetch-bin')
url="https://codeberg.org/tsuniko/osufetch"
license=('0BSD')
source=("$pkgname-$pkgver::https://codeberg.org/tsuniko/osufetch/releases/download/v$pkgver/osufetch")
sha256sums=('3f364e2fd41ecf99d8e2683e360c6a8b8748ae870054de016be3e132fccbaf4e')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/osufetch"
}
