# Maintainer: Dallleworthy (https://github.com/Dallleworthy)
pkgname=colorconvert
pkgver=0.0.1
pkgrel=1
pkgdesc="Hyprland сolor сonverter with color picker. Format like: 0x+opacity+hex. Example: 0x9C0DFF00"
arch=('x86_64')
url="https://github.com/govnorice/HyprlandColorConverter" 
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'gtk3'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=("https://github.com/govnorice/HyprlandColorConverter/releases/download/$pkgver/colorconvert")
sha256sums=('SKIP')
build() {
  :
}
package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/colorconvert" "$pkgdir/usr/bin/colorconvert"
  chmod +x "$pkgdir/usr/bin/colorconvert"
}