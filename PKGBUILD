# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=oxidizebot-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='High performance Twitch bot in Rust'
url='https://github.com/udoprog/OxidizeBot'
source=("https://github.com/udoprog/OxidizeBot/releases/download/$pkgver/oxidize-$pkgver-linux-x86_64.zip")
arch=(x86_64)
license=(Apache)
sha256sums=('46fa917ed8fdbe1ba966580f51f6ace9084660a87727afac6aeeea6885f07436')

package() {
  cd "$srcdir"
  install -Dm755 oxidize "${pkgdir}/usr/bin/oxidize"
}
