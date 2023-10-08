# Maintainer: VVL <me@ivvl.ru>

pkgname=bip39-standalone
pkgver=0.5.6
pkgrel=1
pkgdesc="A tool for converting BIP39 mnemonic phrases to addresses and private keys."
arch=(any)
url="https://github.com/iancoleman/bip39"
license=('MIT')
source=("https://github.com/iancoleman/bip39/releases/download/$pkgver/bip39-standalone.html")
optdepends=('nginx: reverse-proxy')
sha256sums=('129b03505824879b8a4429576e3de6951c8599644c1afcaae80840f79237695a')
package() {
	cd "$srcdir"
	install -Dm755 bip39-standalone.html "$pkgdir/usr/share/webapps/bip39-standalone.html"
}
