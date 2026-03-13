# Maintainer: tee < teeaur at duck dot com >
pkgname=pktstat-go-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple ethernet interface traffic monitor and reporting tool, replacement for pktstat"
arch=(x86_64)
url="https://github.com/dkorunic/pktstat"
license=('MIT')
provides=('pktstat')
conflicts=('pktstat')
replaces=()
source=("$url/releases/download/v$pkgver/pktstat_${pkgver}_linux_amd64.pkg.tar.zst")
b2sums=('4884136a739678a5a64e13f73069383eef9e6074bd41ceea85e2ab158cf3c2d33c6a8c37dfe41240248efc091f25b53436abe2c7a67dff664b63702dc51e2cf6')

package() {
  install -Dm755 usr/bin/pktstat -t "$pkgdir/usr/bin"
}
