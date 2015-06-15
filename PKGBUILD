# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
# Contributor: alzen <mynick2(at)gmail(dot)com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gkrellm-fmonitor  
pkgver=2.0.4
pkgrel=3
pkgdesc="A simple but useful gkrellm plugin displaying lines from a text file"
url="http://sites.google.com/site/makovick/gkrellm-plugins"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gkrellm')
source=(http://sites.google.com/site/makovick/projects/$pkgname-$pkgver.tgz)
md5sums=('5f9c443151d117842f25899b9e0db936')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m755 -D fmonitor.so $pkgdir/usr/lib/gkrellm2/plugins/fmonitor.so
}
