# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=kensaku-bin
pkgver=0.1.0
pkgrel=2
pkgdesc='Quick and easy search for Japanese kanji, radicals, and words'
arch=('x86_64')
url="https://github.com/LiteracyFanatic/kensaku"
license=('MIT')
depends=('dotnet-runtime')
options=('!strip')
source=("https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku-linux-x64"
        "https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku.db")
sha256sums=('e5f498421cb066eda4fcfdf39bba059241d71344d2e39797740bb86087f53c71'
            '8b88b0abe0bff5d29232c7363a6b980ababc7b3d796d218c10d985d526711b42')

package() {
    install -Dm755 "$srcdir/kensaku-linux-x64" "$pkgdir/usr/bin/kensaku"
    install -Dm644 "$srcdir/kensaku.db" "$pkgdir/usr/share/kensaku/kensaku.db"
}
