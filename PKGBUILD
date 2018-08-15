# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=netclasses
pkgrel=1
pkgver=1.1.0
pkgdesc='Networking framework for GNUstep and Mac OS X'
arch=('i686' 'x86_64' 'armv7h')
url='http://gap.nongnu.org/talksoup/index.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc')
source=("http://savannah.nongnu.org/download/gap/netclasses-1.1.0.tar.gz")
sha256sums=('d7d783c5b85abb289ef2fbb4bbf709eacb631e6ddf5a78e26fa45b94fb717f40')

build() {
  cd "$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}