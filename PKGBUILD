# Maintainer: ksc98 <ksc98@users.noreply.github.com>
pkgname=nba-tv-bin
pkgver=1.5.17
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
sha256sums=('735fa5fb91e268d7ded05dd8f66893d27af5f33c01b4b5205e95335ef2b45e94')

package() {
    install -Dm755 "$srcdir/nba-tv" "$pkgdir/usr/bin/nba-tv"
}
