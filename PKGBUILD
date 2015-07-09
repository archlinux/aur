# Contributor: bender02 at archlinux dot us
pkgname=gkrellm-wifi
pkgver=0.9.12
pkgrel=1
pkgdesc="A GKrellM2 plug-in for monitoring the link quality of your wireless LAN cards"
arch=(i686 x86_64)
license=('GPL2')
depends=('gkrellm')
url="https://github.com/tecknicaltom/gkrellm-wifi"
source=(https://github.com/downloads/tecknicaltom/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3b9a71c9177d8e058f5707baeb0da761')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 gkrellm-wifi.so $pkgdir/usr/lib/gkrellm2/plugins/gkrellm-wifi.so
}

# vim: ts=2: ft=sh
