# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=oxidizebot-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='High performance Twitch bot in Rust'
url='https://github.com/udoprog/OxidizeBot'
source=("https://github.com/udoprog/OxidizeBot/releases/download/$pkgver/oxidize-$pkgver-x86_64-linux.zip")
arch=(x86_64)
license=(Apache)
sha256sums=('e069aa146c1adeefeb8d446ed598d77039c6a18827527443165b4dfb4a4a5818')

package() {
  cd "$srcdir"
  install -Dm755 oxidize "${pkgdir}/usr/bin/oxidize"
}
