# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nak-bin"
pkgver="0.7.3"
pkgrel="1"
pkgdesc="a command line tool for doing all things nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('7024add27fde7b51864e2dac667d664a28155453841db995bf96fba00b380c94')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}
