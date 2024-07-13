# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nak-bin"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="a command line tool for doing all things nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('f9c31bfcc8d4d12ef9c273fed01a317bc816e5f4d550439c279a4d8587758d6f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}
