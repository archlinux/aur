# Maintainer: Kyle Chang <kylechang96@gmail.com>
pkgname=nba-tv-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Watch NBA streams in mpv from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ksc98/homebrew-tap"
license=('MIT')
depends=('mpv')
optdepends=('whisper.cpp: live subtitles via --with-subs')
provides=('nba-tv')
conflicts=('nba-tv')

source_x86_64=("nba-tv-$pkgver-x86_64.tar.gz::https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v$pkgver/nba-tv-linux-x86_64.tar.gz")
source_aarch64=("nba-tv-$pkgver-aarch64.tar.gz::https://github.com/ksc98/homebrew-tap/releases/download/nba-tv-v$pkgver/nba-tv-linux-arm64.tar.gz")

sha256sums_x86_64=('738594479d626040f0fdc36059e6598b901589e822eca461453fbcc0d28012b0')
sha256sums_aarch64=('b068fa7531281260662bddad98b2c40ee420136f906e74bf5561741ded1820cb')

package() {
    install -Dm755 "$srcdir/nba-tv" "$pkgdir/usr/bin/nba-tv"
}
