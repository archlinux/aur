# Maintainer: Jeff Henson <jeff at henson dot io>

pkgname=detach
pkgver=0.2.3
pkgrel=1
pkgdesc="Utiltiy for running a command detached from the current terminal."
arch=('i686' 'x86_64')
url="http://inglorion.net/software/detach/"
license=('custom')
source=(http://inglorion.net/download/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('b2070e708d4fe3a84197e2a68f25e477dba3c2d8b1f9ce568f70fc8b8e8a30f0')

build() {
  cd $srcdir/$pkgname-$pkgver
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX="${pkgdir}/usr" install
}

