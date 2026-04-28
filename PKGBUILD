# Maintainer: ksc98 <ksc98@users.noreply.github.com>
pkgname=nba-tv-bin
pkgver=1.5.35
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
sha256sums=('cf51a87e0c3892972c76bfb4fb08ff180c29049fc016c522b5d758789f207e6a')

package() {
    install -Dm755 "$srcdir/nba-tv" "$pkgdir/usr/bin/nba-tv"
}
