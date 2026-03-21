# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}

pkgname="nak-bin"
pkgver="0.19.2"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('efc18efd67c8995a3446078c6e909d6906b8ee7499150e111db243b94aa15683')
