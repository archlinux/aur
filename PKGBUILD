# Maintainer: Ben Edwards <ben@artfuldodge.io>
pkgname=web3j
pkgver=4.2.0
pkgrel=1
pkgdesc='A lightweight, reactive, type safe Java and Android library for integrating with nodes on Ethereum blockchains'
arch=('any')
url='https://web3j.io/'
license=('Apache')
depends=('java-runtime>=8')
source=('web3j'
        "https://github.com/web3j/web3j/releases/download/v${pkgver}/web3j-${pkgver}.tar"
        "https://github.com/web3j/web3j/releases/download/v${pkgver}/web3j-${pkgver}.tar.asc")
sha256sums=('410a2c96c3dfcf1db1a3db0de346e25334b7b8b817bece714559845f21a65a57'
            'c01532cc5937007a7df1b2074972cb44b4ebeb4f32b923cca3c009b10b57049d'
            'SKIP')
validpgpkeys=('8756C4F765C9AC3CB6B85D62379CE192D401AB61')
package() {
  cd "$pkgname-$pkgver"
  install -D -m644 -t "$pkgdir/usr/share/java/web3j" lib/*
  install -D -m755 "$srcdir/web3j"  "$pkgdir/usr/bin/web3j"
}
