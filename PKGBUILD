# Maintainer: tsuniko <cuzimmrdna@gamil.com>
pkgname=osu-fetch-bin
pkgver=1.0
pkgrel=1
pkgdesc="fastfetch-like stats printing for osu!"
arch=('x86_64')
url="https://codeberg.org/tsuniko/osufetch.git"
license=('0BSD')
source=("$pkgname-$pkgver::https://codeberg.org/tsuniko/osufetch/releases/download/v$pkgver/osufetch")
sha256sums=('c00d841a0d7cbc6d11098e735d231ce4c8f9e53d652b87245c77911a1852fd66')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/osufetch"
}
