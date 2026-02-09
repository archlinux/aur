# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A competitive Racing Game"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack"
license=('unknown')
source=("https://github.com/SoupcanUBG/$pkgname/releases/download/Releases/PolyTrack-linux-x64.tar.gz")
sha256sums=('SKIP')



package() {

install -d "$pkgdir/usr/share/$pkgname"

tar -xzf "$srcdir/PolyTrack-linux-x64.tar.gz" -C "$pkgdir/usr/share/$pkgname"

install -d "$pkgdir/usr/share/applications"


install -Dm644 "$pkgdir/usr/share/$pkgname/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

install -Dm644 "$pkgdir/usr/share/$pkgname/icon.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

}

