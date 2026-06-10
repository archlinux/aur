# Maintainer: Mikele <mikele@gmail.com>

pkgname=fila-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Browse folders, filter media, generate playlists, and play files"
arch=('x86_64')
url="https://github.com/mikelexp/Fila"
depends=('mpv' 'ffmpeg' 'xdg-utils')
source=("https://github.com/mikelexp/Fila/releases/download/v0.2.1/fila-0.2.1-linux-x86_64.tar.gz")
sha256sums=('92d9fcd6b4705f54d7e44a238a9236b869abca0b0fd179c8d712183c99ccf56b')

package() {
  cd "$srcdir"

  install -Dm755 fila "$pkgdir/usr/bin/fila"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fila.png"
  install -Dm644 fila.desktop "$pkgdir/usr/share/applications/fila.desktop"
}
