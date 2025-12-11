# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.5.9
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('3590bcb90a75c32ba8b10d692d26838caedbc267a57db23931694abc9598c873')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
