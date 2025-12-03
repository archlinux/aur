# Maintainer: tee < teeaur at duck dot com >
pkgname=pktstat-go-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple ethernet interface traffic monitor and reporting tool, replacement for pktstat"
arch=(x86_64)
url="https://github.com/dkorunic/pktstat"
license=('MIT')
provides=('pktstat')
conflicts=('pktstat')
replaces=()
source=("$url/releases/download/v$pkgver/pktstat_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('590afef11358f8d0b87994ff92cfb7c7452f84ecb8cf947a4dd2f297ea04454c')

package() {
  install -Dm755 usr/bin/pktstat -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4:
