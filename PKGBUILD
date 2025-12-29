# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.6.1
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('8cb3cdeec5b0acd39328e36a1fd498bbfa2af4b2d00e21de1c1293029c303864')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
