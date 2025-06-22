# Maintainer: tee < teeaur at duck dot com >
pkgname=pktstat-go-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple ethernet interface traffic monitor and reporting tool, replacement for pktstat"
arch=(x86_64)
url="https://github.com/dkorunic/pktstat"
license=('MIT')
provides=('pktstat')
conflicts=('pktstat')
replaces=()
source=("$url/releases/download/v$pkgver/pktstat_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('7ecee777a3742cbb0505ebc09e3ff096442e5a689a8e11c608c56b313c00fd9a')

package() {
  install -Dm755 usr/bin/pktstat -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
