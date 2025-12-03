# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.5.8
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('c0e27a54d5d036c686864d7753f2745f114cb81f573128b6ac846479ceaa11a2')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
