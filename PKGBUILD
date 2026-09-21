# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}

pkgname="nak-bin"
pkgver="0.20.7"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")

sha256sums=('907fe2e1b5d52098eb51ae54f9b898fa66f3a9b65204896502aa6977394e7cda')
sha256sums=('b44b36c792fbc3fb73b7ba3bbc94beda2219826271aa8d5f130f569c3817c3b9')
sha256sums=('ba918fafd1b030bc50958a5b218c6386f4c3a57c1e469562d3947e858e0ba56e')
