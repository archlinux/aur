# Maintainer: Mikele <mikele@gmail.com>

pkgname=fila-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Browse folders, filter media, generate playlists, and play files"
arch=('x86_64')
url="https://github.com/mikelexp/Fila"
depends=('mpv' 'ffmpeg' 'xdg-utils')
source=("https://github.com/mikelexp/Fila/releases/download/v0.2.0/fila-0.2.0-linux-x86_64.tar.gz")
sha256sums=('79aba470e2b42a7a022dae4f196efe4c016621b25f7f645d3772c8209f32e4d5')

package() {
  cd "$srcdir"

  install -Dm755 fila "$pkgdir/usr/bin/fila"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fila.png"
  install -Dm644 fila.desktop "$pkgdir/usr/share/applications/fila.desktop"
}
