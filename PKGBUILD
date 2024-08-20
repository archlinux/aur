# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nak-bin"
pkgver="0.7.0"
pkgrel="1"
pkgdesc="a command line tool for doing all things nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('87ce9bee0e1bd94671dfa843166b0e72480742927c0a25a308a604a3ba2834dd')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}
