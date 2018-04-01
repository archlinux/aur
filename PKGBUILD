# Maintainer: Your Name <ben@artfuldodge.io>
pkgname=web3j
pkgver=3.3.1
pkgrel=1
pkgdesc='A lightweight, reactive, type safe Java and Android library for integrating with nodes on Ethereum blockchains'
arch=('any')
url='https://web3j.io/'
license=('Apache')
depends=('java-runtime')
source=('web3j'
        'https://github.com/web3j/web3j/releases/download/v3.3.1/web3j-3.3.1.tar'
        'https://github.com/web3j/web3j/releases/download/v3.3.1/web3j-3.3.1.tar.asc')
md5sums=('414fe48c9297fae26241a7b3acefe349'
         '61d86dfbb48ddc02146029f03122b024'
         'SKIP')
validpgpkeys=('99854D26AD9C565C34BCE2471295E078F64311DB')
package() {
  cd "$pkgname-$pkgver"
  install -D -m644 -t "$pkgdir/usr/share/java/web3j" lib/*
  install -D -m755 "$srcdir/web3j"  "$pkgdir/usr/bin/web3j"
}
