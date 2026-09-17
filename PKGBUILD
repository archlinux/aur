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
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz"
)

sha256sums=(
    'SKIP'
)

package() {
    cd "$srcdir/$pkgname-main"

    install -Dm755 badapple-hd \
        "$pkgdir/usr/bin/badapple-hd"

    install -Dm644 badapple.mp4 \
        "$pkgdir/usr/share/badapple-hd/badapple.mp4"
}
