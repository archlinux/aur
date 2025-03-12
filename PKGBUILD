# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=kensaku-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Quick and easy search for Japanese kanji, radicals, and words'
arch=('x86_64')
url="https://github.com/LiteracyFanatic/kensaku"
license=('MIT')
depends=('dotnet-runtime')
options=('!strip')
source=("https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku-linux-x64"
        "https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku.db")
sha256sums=('9e57a6234a57c300dfc36066eddb7bd0f122722cafa3083cab74cd2f8b760d38'
            '6b4afb0a5f4446eab039263359ad5e58f29b1817d8fa95d41cebd6670248142f')

package() {
    install -Dm755 "$srcdir/kensaku-linux-x64" "$pkgdir/usr/bin/kensaku"
    install -Dm644 "$srcdir/kensaku.db" "$pkgdir/usr/share/kensaku/kensaku.db"
}
