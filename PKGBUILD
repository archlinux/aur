# Maintainer: Mikele <mikele@gmail.com>

pkgname=fila-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Browse folders, filter media, generate playlists, and play files"
arch=('x86_64')
url="https://github.com/mikelexp/Fila"
depends=('mpv' 'ffmpeg' 'xdg-utils')
source=("https://github.com/mikelexp/Fila/releases/download/v0.3.0/fila-0.3.0-linux-x86_64.tar.gz")
sha256sums=('d86d308b8ed1b6e2a39e02162ecede41a5c26b99687294080802cf5797de6996')

package() {
  cd "$srcdir"

  install -Dm755 fila "$pkgdir/usr/bin/fila"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fila.png"
  install -Dm644 fila.desktop "$pkgdir/usr/share/applications/fila.desktop"
}
