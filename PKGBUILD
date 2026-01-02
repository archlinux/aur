# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.6.4
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11' 'libxtst')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('c22a61810d3a47f1e882e1fb5cd19ca3a57cd1df7dec7dcc5c7f7ca6ea8239fa')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
