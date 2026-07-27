# Maintainer: Mikele <mikele@gmail.com>

pkgname=fila-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Browse folders, filter media, generate playlists, and play files"
arch=('x86_64')
url="https://github.com/mikelexp/Fila"
depends=('mpv' 'ffmpeg' 'xdg-utils')
source=("https://github.com/mikelexp/Fila/releases/download/v0.2.2/fila-0.2.2-linux-x86_64.tar.gz")
sha256sums=('27c803bfc198970b56e4928e67a489da2c7787cc15c214e1246012a2d334e267')

package() {
  cd "$srcdir"

  install -Dm755 fila "$pkgdir/usr/bin/fila"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fila.png"
  install -Dm644 fila.desktop "$pkgdir/usr/share/applications/fila.desktop"
}
