# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs via Ollama (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
provides=('genote')
conflicts=('genote')
source=("https://github.com/xmb03/Genote/releases/download/v$pkgver/genote-linux-x86_64.tar.gz")
sha256sums=('b0e54029252fda0948c69041b4a17a0c3c962c9fca01ea27ea6eb45f7a1ab556')

package() {
  tar -xzf "$srcdir/genote-linux-x86_64.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/genote" "$pkgdir/usr/bin/genote"
}
