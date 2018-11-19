# Maintainer: Ben Edwards <ben@artfuldodge.io>
pkgname=web3j
pkgver=4.0.1
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
            'e6b32db30b0fa80c362f294aa2e2f6b899099a8c67542a07e7400b63ce1a7935'
            'SKIP')
validpgpkeys=('8B40952CA3992D634A4D5D4263163998D66F3CB3')
package() {
  cd "$pkgname-$pkgver"
  install -D -m644 -t "$pkgdir/usr/share/java/web3j" lib/*
  install -D -m755 "$srcdir/web3j"  "$pkgdir/usr/bin/web3j"
}
