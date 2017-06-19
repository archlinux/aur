# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname='jam'
pkgver=0.4.1
pkgrel=1
pkgdesc="A Google Play Music console player written in Go (stable release)"
arch=('x86_64')
url="https://github.com/budkin/jam"
license=('MIT')
depends=('pulseaudio')
provides=('jam')
conflicts=('jam')
source=("$pkgname::https://github.com/budkin/jam/releases/download/v${pkgver}/jam_x64")
md5sums=('13f56d00a4f4bf96b21c720199060814')

build() {
  chmod +x $srcdir/jam
}

package() {
  cd $pkgdir
  mkdir -p usr/bin
  cp $srcdir/jam usr/bin/jam
  chmod 755 usr/bin/jam
}
