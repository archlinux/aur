# Maintainer: tsuniko <cuzimmrdna@gamil.com>
pkgname=osu-fetch-bin
pkgver=1.1
pkgrel=1
pkgdesc="fastfetch-like stats printing for osu!"
arch=('x86_64')
conflicts=('osufetch-bin')
url="https://codeberg.org/tsuniko/osufetch"
license=('0BSD')
source=("$pkgname-$pkgver::https://codeberg.org/tsuniko/osufetch/releases/download/v$pkgver/osufetch")
sha256sums=('751e16d94f0534f950acff0e32930519d1c3a6c773b13c325d8a05eaefedd5e0')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/osufetch"
}
