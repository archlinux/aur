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
sha256sums=('6b23bf273fd7d307f0f2a5e2b13613b71c9a8ec9855fa912bb53be21bd9ed3f5')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
