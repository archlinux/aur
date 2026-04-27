# Maintainer: ksc98 <ksc98@users.noreply.github.com>
pkgname=nba-tv-bin
pkgver=1.5.18
pkgrel=1
pkgdesc="Watch NBA streams in mpv from your terminal"
arch=('x86_64')
url="https://github.com/ksc98/homebrew-tap"
license=('MIT')
depends=('mpv')
optdepends=('whisper.cpp: live subtitles via --with-subs')
provides=('nba-tv')
conflicts=('nba-tv')

source=("nba-tv-$pkgver-x86_64.tar.gz::https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v$pkgver/nba-tv-linux-x86_64.tar.gz")
sha256sums=('b4bf75075d9e6f9de0b7d62f39deb94343c71a373a5a8969765f7bc11bf902de')

package() {
    install -Dm755 "$srcdir/nba-tv" "$pkgdir/usr/bin/nba-tv"
}
