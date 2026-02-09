# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack-bin
pkgver=0.5.2
pkgrel=3
pkgdesc="A competitive Racing Game Called PolyTrack"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack-bin"
license=('unknown')
source=("https://github.com/SoupcanUBG/$pkgname/releases/download/Releases/PolyTrack-linux-x64.tar.gz")
sha256sums=('sha256:bf5d4f9b0ae922ebdaf7c3f65eea417c494e34ece4e25817f0109cd086452515')



package() {

install -d "$pkgdir/usr/share/$pkgname"

tar -xzf "$srcdir/PolyTrack-linux-x64.tar.gz" -C "$pkgdir/usr/share/$pkgname"

install -d "$pkgdir/usr/share/applications"


install -Dm644 "$pkgdir/usr/share/$pkgname/polytrack.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

install -Dm644 "$pkgdir/usr/share/$pkgname/icon.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

}

