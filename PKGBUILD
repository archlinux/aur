# Maintainer: ksc98 <ksc98@users.noreply.github.com>
pkgname=nba-tv-bin
pkgver=1.5.10
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
sha256sums=('744030d4e2299ba75f0fb8fa08063ed499d8e0280633fdb146b8c8a61ea9f7e7')

package() {
    install -Dm755 "$srcdir/nba-tv" "$pkgdir/usr/bin/nba-tv"
}
