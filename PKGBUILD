# Maintainer: Brandon Greenwell <greenwell.brandon@gmail.com>

pkgname=lstr-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal document viewer for .docx files"
url="https://github.com/bgreenwell/lstr"
license=("MIT")
arch=("x86_64")
provides=("lstr")
conflicts=("lstr")
source=("https://github.com/bgreenwell/lstr/releases/download/v$pkgver/lstr-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("748b78f0c10996cfc3e0b6a49242d4e318313ff4e15b5ddf4bfa630b078bf898")

package() {
    cd "$srcdir/lstr-x86_64-unknown-linux-gnu"
    install -Dm755 lstr -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
