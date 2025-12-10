# Maintainer: tee < teeaur at duck dot com >
pkgname=pktstat-go-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple ethernet interface traffic monitor and reporting tool, replacement for pktstat"
arch=(x86_64)
url="https://github.com/dkorunic/pktstat"
license=('MIT')
provides=('pktstat')
conflicts=('pktstat')
replaces=()
source=("$url/releases/download/v$pkgver/pktstat_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('a6a92127ce7ba07ead946a1fdf44a0ef7eabc1fe5c6657d64a676c58673788e4')

package() {
  install -Dm755 usr/bin/pktstat -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4:
