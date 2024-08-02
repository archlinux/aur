# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=world-of-goo-2
pkgver=12329.171
pkgrel=1
pkgdesc="Build bridges, grow towers, terraform terrain, and fuel flying machines in the followup to World of Goo."
arch=("x86_64")
url="https://worldofgoo2.com"
license=('custom')
depends=()
source=("world-of-goo-2.desktop" "world-of-goo-2.png" "World_of_Goo_2-x86_64.12329.171.AppImage")

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "$pkgdir/usr/share/applications"

  chmod +x "$srcdir/World_of_Goo_2-x86_64.$pkgver.AppImage"
  cp -r "$srcdir/World_of_Goo_2-x86_64.$pkgver.AppImage" "$pkgdir/usr/bin/$pkgname"
  
  cp "$srcdir/world-of-goo-2.desktop" "$pkgdir/usr/share/applications/world-of-goo-2.desktop"
  cp "$srcdir/world-of-goo-2.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/world-of-goo-2.png"
}

sha256sums=('bdbccb2818a242beb073d2d47e62b7852a5655ab83fb347f8b23b51bfff9d282'
            '54ef5f65d8ad932bbe1e3d8431002ba7e9cc16d366bbfc33ef67b6eaee1e0614'
            'fdd39d7abdf7de5aa02a2f9d402233795b4f39b458b27e4b49895d5c55da2bca')
