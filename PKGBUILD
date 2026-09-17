pkgname=badapple-hd
pkgver=1.0.0
pkgrel=1
pkgdesc="Play badapple in your terminal in the highest quality possible!"
arch=('any')
url="https://github.com/Raj-1727/badapple-hd"
license=('MIT')

depends=(
    'python'
    'ffmpeg'
    'figlet'
    'lolcat'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "badapple.mp4"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 badapple-hd \
        "$pkgdir/usr/bin/badapple-hd"

    install -Dm644 "$srcdir/badapple.mp4" \
        "$pkgdir/usr/share/badapple-hd/badapple.mp4"
}
