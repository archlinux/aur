# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.6.2
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('c8e44611cb9c9fdab70a802781c8871621f35f240cf2d17efb0e221382eeb9d7')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
