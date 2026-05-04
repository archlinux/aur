# Maintainer: dcordonu <dcordonu@gmail.com>
pkgname=spotify-dl-bin
pkgver=0.10.2
pkgrel=2
pkgdesc="A command-line utility to download songs and playlists directly from Spotify"
arch=('x86_64')
url="https://github.com/dcordonu/spotify-dl"
license=('MIT')
depends=('openssl')
provides=('spotify-dl')
source=(
	"$pkgname::$url/releases/download/v$pkgver/spotify-dl"
        "https://raw.githubusercontent.com/dcordonu/spotify-dl/v$pkgver/LICENSE"
)
sha256sums=('ed1a05e935784988a57cd583a1d824675efdf71c5fbe033797fc90bee334dcb8' 'SKIP')

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/spotify-dl"
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

