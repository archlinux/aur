# Maintainer: tee < teeaur at duck dot com >
pkgname=pktstat-go-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple ethernet interface traffic monitor and reporting tool, replacement for pktstat"
arch=(x86_64)
url="https://github.com/dkorunic/pktstat"
license=('MIT')
provides=('pktstat')
conflicts=('pktstat')
replaces=()
source=("$url/releases/download/v$pkgver/pktstat_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('38ce4d424251e9a1ccfeecdb3ff109056ee1a4ea7c74ba11a0641affc4987971')

package() {
  install -Dm755 usr/bin/pktstat -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
