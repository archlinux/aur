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
    "$pkgname::https://raw.githubusercontent.com/Raj-1727/badapple-hd/main/badapple-hd"
    "badapple.mp4::https://raw.githubusercontent.com/Raj-1727/badapple-hd/main/badapple.mp4"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "$srcdir/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/badapple.mp4" \
        "$pkgdir/usr/share/badapple-hd/badapple.mp4"
}
