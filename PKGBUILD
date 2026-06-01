# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack-bin
pkgver=0.6.2
pkgrel=3
pkgdesc="A competitive Racing Game Called PolyTrack"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack-bin"
license=('unknown')
source=("https://github.com/SoupcanUBG/$pkgname/releases/download/$pkgver/PolyTrack-v$pkgver-linux-x64.tar.gz")
sha256sums=('73009bfc8850ae7b76ce66b26ad3ebae42a8a3ed4bf11f017a6e8db9ee1a484e')



package() {

install -d "$pkgdir/usr/share/polytrack"

tar -xzf "$srcdir/PolyTrack-v$pkgver-linux-x64.tar.gz" -C "$pkgdir/usr/share/polytrack"

install -d "$pkgdir/usr/share/applications"


install -Dm644 "$pkgdir/usr/share/polytrack/polytrack.desktop" \
    "$pkgdir/usr/share/applications/polytrack.desktop"

install -Dm644 "$pkgdir/usr/share/polytrack/icon.png" \
    "$pkgdir/usr/share/pixmaps/polytrack.png"

}

