# Maintainer: sanekpixel101 <sanekpixel101@gmail.com>

pkgname=genote-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Generate IT study notes using local LLMs and cloud APIs (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/xmb03/Genote"
license=('MIT')
depends=('gcc-libs')
provides=('genote')
conflicts=('genote')
source=("https://github.com/xmb03/Genote/releases/download/v$pkgver/genote-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4774f121cec8fea08e367e076176c6b66b9aa5bc1240fc2761e77254325eb222')

package() {
  tar -xzf "$srcdir/genote-x86_64-unknown-linux-gnu.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/genote" "$pkgdir/usr/bin/genote"
}
