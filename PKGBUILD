pkgname=badapple-hd
pkgver=1.0.0
pkgrel=2
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
    "badapple-hd"
    "badapple.mp4::https://raw.githubusercontent.com/Raj-1727/badapple-hd/main/badapple.mp4"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "$srcdir/badapple-hd" \
        "$pkgdir/usr/bin/badapple-hd"

    install -Dm644 "$srcdir/badapple.mp4" \
        "$pkgdir/usr/share/badapple-hd/badapple-hd/badapple.mp4"
}
