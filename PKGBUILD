# Maintainer: Faezix <faezix@github.com>
pkgname=yt-transcriber-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI tool to extract YouTube video transcripts with timestamps"
arch=('x86_64' 'aarch64')
url="https://github.com/Faeziix/yt-transcriber"
license=('MIT')
depends=('yt-dlp')
provides=('yt-transcriber')
conflicts=('yt-transcriber')
options=('!debug')
install=yt-transcriber.install

source_x86_64=(
    "https://github.com/Faeziix/yt-transcriber/releases/download/v${pkgver}/yt-transcriber-linux-x86_64.tar.gz"
)
source_aarch64=(
    "https://github.com/Faeziix/yt-transcriber/releases/download/v${pkgver}/yt-transcriber-linux-aarch64.tar.gz"
)
source=(
    "LICENSE::https://raw.githubusercontent.com/Faeziix/yt-transcriber/v${pkgver}/LICENSE"
)
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "$srcdir/yt-transcriber" "$pkgdir/usr/bin/yt-transcriber"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
