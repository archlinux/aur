# Maintainer: tee < teeaur at duck dot com >
pkgname=roapi-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="ROAPI automatically spins up read-only APIs for static datasets"
arch=(x86_64)
url="https://rilldata.com"
license=(Apache-2.0)
source=("roapi-$pkgver.tgz::https://github.com/roapi/roapi/releases/download/roapi-v$pkgver/roapi-x86_64-unknown-linux-musl.tar.gz")
b2sums=('b7e579949ab5c9b0aeeb26acf02ec1b10d165f9127dabe0ce79543676e6eb23b40778cc0b218a09715644daa408d40067e824f8951b28dc1519df96aa5c6ee39')

package() {
  install -Dm755 roapi -t "$pkgdir/usr/bin/"
}
