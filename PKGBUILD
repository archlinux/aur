# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    install -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin"
}

pkgname="nak-bin"
pkgver="0.17.0"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")
sha256sums=('a24bfc240ec188f78ca21cf6e255bdadc17009eb38acd02fe7ef62f6a7707a41')
sha256sums=('495243c070c4533ce96e98b6f34b7e97fd4be2da3353488b400233ed7ed0d4da')
sha256sums=('c5068bb999c3f8e557607d158090869552f06603147051e7f513cafc208208e0')
