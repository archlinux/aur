# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: dibblethewrecker .at. jiwe .dot. org

pkgname=gkrellmpc
pkgver=0.1_beta9
pkgrel=6
pkgdesc="A mpd control plugin for gkrellm2"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gkrellm' 'curl')
source=("http://mina.naguib.ca/dist/$pkgname-$pkgver.tar.gz")
url="http://mpd.wikia.com/wiki/Client:GKrellMPC"
md5sums=('cb3ba81e7e9a73f0e84623d50df09340')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gkrellmpc.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellmpc.so"
}
# vim: ts=2 sw=2 et ft=sh
