# Maintainer: Mikele <mikele@gmail.com>

pkgname=fila-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Browse folders, filter media, generate playlists, and play files"
arch=('x86_64')
url="https://github.com/mikelexp/Fila"
depends=('mpv' 'ffmpeg' 'xdg-utils')
source=("https://github.com/mikelexp/Fila/releases/download/v0.2.3/fila-0.2.3-linux-x86_64.tar.gz")
sha256sums=('98263a68f21f0ed2313e8da96e4920b49d26622e933344397f387134ae5bcc9a')

package() {
  cd "$srcdir"

  install -Dm755 fila "$pkgdir/usr/bin/fila"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fila.png"
  install -Dm644 fila.desktop "$pkgdir/usr/share/applications/fila.desktop"
}
