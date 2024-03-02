# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=oxidizebot-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='High performance Twitch bot in Rust'
url='https://github.com/udoprog/OxidizeBot'
source=("https://github.com/udoprog/OxidizeBot/releases/download/$pkgver/oxidize-$pkgver-x86_64-linux.zip")
arch=(x86_64)
license=(Apache)
sha256sums=('1ba7633abfeb65c920515b0765fc4a2eb16a9fc26ee08e130fa1e23ef2fc8018')

package() {
  cd "$srcdir"
  install -Dm755 oxidize "${pkgdir}/usr/bin/oxidize"
}
