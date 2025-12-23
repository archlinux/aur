# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.6.0
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('2ea5a3a710c8760eb60ff5762e9a258f77a792f272dfd3869ffc52cd2debea55')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
