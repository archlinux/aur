# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=oxidizebot-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='High performance Twitch bot in Rust'
url='https://github.com/udoprog/OxidizeBot'
source=("https://github.com/udoprog/OxidizeBot/releases/download/$pkgver/oxidize-$pkgver-linux-x86_64.zip")
arch=(x86_64)
license=(Apache)
sha256sums=('847d70bb398b40bb1d5f9b100c31a22e959da6e26652cd96941ef671531d5e15')

package() {
  cd "$srcdir"
  install -Dm755 oxidize "${pkgdir}/usr/bin/oxidize"
}
