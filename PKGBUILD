# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="A competitive Racing Game Called PolyTrack"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack-bin"
license=('unknown')
source=("https://github.com/SoupcanUBG/$pkgname/releases/download/0.6.0/PolyTrack-linux-x64.tar.gz")
sha256sums=('a9a32edb2eacef04d4be980a56fc27c22859a0394ac422865d66d107601cc386')



package() {

install -d "$pkgdir/usr/share/polytrack"

tar -xzf "$srcdir/PolyTrack-linux-x64.tar.gz" -C "$pkgdir/usr/share/polytrack"

install -d "$pkgdir/usr/share/applications"


install -Dm644 "$pkgdir/usr/share/polytrack/polytrack.desktop" \
    "$pkgdir/usr/share/applications/polytrack.desktop"

install -Dm644 "$pkgdir/usr/share/polytrack/icon.png" \
    "$pkgdir/usr/share/pixmaps/polytrack.png"

}

