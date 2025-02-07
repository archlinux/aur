# Maintainer: fiatjaf <fiatjaf@gmail.com>

pkgname="nak-bin"
pkgver="0.11.3"
pkgrel="1"
pkgdesc="a command line tool for doing all things nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('a820fc02f9fd6fd55bf00575c0647668331d4e12041d79ec56ddec766f42eb6e')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}
