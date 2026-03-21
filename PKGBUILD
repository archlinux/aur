# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polymodloader-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="A Mod Loader for PolyTrack"
arch=('x86_64')
url="https://codeberg.org/polytrackmods/PolyModLoader"
license=('unknown')
source=("https://codeberg.org/polytrackmods/PolyModLoader/releases/download/v$PKGVER-2/linux.tar.gz")
sha256sums=('8594fcc5194a85513301b8f4c311ed00a9d9a52f3cf850cb2990ffe8c7cf0e50')



package() {

install -d "$pkgdir/usr/share/pml"

tar -xzf "$srcdir/linux.tar.gz" -C "$pkgdir/usr/share/pml"

install -d "$pkgdir/usr/share/applications"


install -Dm644 "$srcdir/pml.desktop" \
    "$pkgdir/usr/share/applications/polymodloader.desktop"

install -Dm644 "$srcdir/icon.png" \
    "$pkgdir/usr/share/pixmaps/pml.png"

}

