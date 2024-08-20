# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nak-bin"
pkgver="0.7.1"
pkgrel="1"
pkgdesc="a command line tool for doing all things nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('81ce79a7de58f22646141f54a7cc6acb9bdb00bee7ec8b182c80a1923da55f3a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}
