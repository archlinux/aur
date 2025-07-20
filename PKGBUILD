# Maintainer: Your Name <your.email@example.com>
pkgname=kon
pkgver=1.0.1
pkgrel=10
pkgdesc="A wallpaper downloader for KDE Plasma from Konachan with fixed 1600x900 preview"
arch=('x86_64')
license=('MIT')
depends=('qt5-tools' 'xorg-xrandr' 'kitty' 'imagemagick')
makedepends=('go')
source=("main.go")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  go build -o kon main.go
}

package() {
  install -Dm755 kon "$pkgdir/usr/bin/kon"
}