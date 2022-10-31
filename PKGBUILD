# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=oxidizebot-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='High performance Twitch bot in Rust'
url='https://github.com/udoprog/OxidizeBot'
source=("https://github.com/udoprog/OxidizeBot/releases/download/$pkgver/oxidize-$pkgver-linux-x86_64.zip")
arch=(x86_64)
license=(Apache)
sha256sums=('133349e6a18510fc14c3010b5fbf2619d51f3a819342bc401f1ed1a820f5da4b')

package() {
  cd "$srcdir"
  install -Dm755 oxidize "${pkgdir}/usr/bin/oxidize"
}
