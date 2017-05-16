# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=vncsnapshot-png
pkgver=1.3
pkgrel=1
pkgdesc='PNG VNC snapshots'
arch=('i686' 'x86_64')
url='https://github.com/ScoreUnder/vncsnapshot-png'
license=('unknown')
source=(https://github.com/ScoreUnder/vncsnapshot-png/archive/version/${pkgver}.tar.gz)
sha256sums=('51207534c7897223c88c931eb31d929695ae855a9b3481f55b3ef6123eeca1d2')

build() {
  cd $srcdir/${pkgname}-version-$pkgver
  make
}

package() {
  cd $srcdir/${pkgname}-version-$pkgver
  install -d $pkgdir/usr/bin
  cp vncsnapshot $pkgdir/usr/bin/
}
