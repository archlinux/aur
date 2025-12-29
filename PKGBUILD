# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.6.3
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('149e8cd3c9e1faa40827a70b3c0d5b0a64d13c0bcefd6d5decb24bca5ad1c348')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
