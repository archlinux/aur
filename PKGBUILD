# Maintainer: Frank Dierolf <frank@dierolf.com>
pkgname=whis
pkgver=0.5.5
pkgrel=1
pkgdesc="Voice-to-text transcription CLI using OpenAI Whisper API"
arch=('x86_64')
url="https://whis.ink"
license=('MIT')
depends=('gcc-libs' 'openssl' 'alsa-lib' 'libx11')
source=("https://github.com/frankdierolf/whis/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('6cbbfeeefe4c712f3852e096b64e7c9bdac964a23d7c76a9629d5e4dfd4d988c')

package() {
    install -Dm755 "$srcdir/whis" "$pkgdir/usr/bin/whis"
}
