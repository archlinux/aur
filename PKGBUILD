# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.5.7
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('ff38a9784a0bcd0cd463a892e63d309655a5054fb06b70d0d493c43edc9b5ed1')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
