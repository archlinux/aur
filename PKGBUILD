# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs via Ollama (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
provides=('genote')
conflicts=('genote')
source=("https://github.com/xmb03/Genote/releases/download/v$pkgver/genote-linux-x86_64.tar.gz")
sha256sums=('794727c120fd8206957ca8f8d59e44e891879687ff3e40681b58600cbca446f0')

package() {
  tar -xzf "$srcdir/genote-linux-x86_64.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/genote" "$pkgdir/usr/bin/genote"
}
