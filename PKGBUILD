# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=kensaku-bin
pkgver=0.2.0
pkgrel=3
pkgdesc='Quick and easy search for Japanese kanji, radicals, and words'
arch=('x86_64')
url="https://github.com/LiteracyFanatic/kensaku"
license=('MIT')
depends=('dotnet-runtime')
options=('!strip')
source=("https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku-linux-x64"
        "https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku.db")
sha256sums=('e5b31a5a9a7b0ed721dcfac5f3fbc815c1c624fa6065b8a3d7308bc2264ccaac'
            'a0ebb33ffaedc9a78fa79e8d7f5d066ae88ba126125029f2b08e40fa7c155b4e')

package() {
    install -Dm755 "$srcdir/kensaku-linux-x64" "$pkgdir/usr/bin/kensaku"
    install -Dm644 "$srcdir/kensaku.db" "$pkgdir/usr/share/kensaku/kensaku.db"
}
