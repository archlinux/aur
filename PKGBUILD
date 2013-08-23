# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=gaussianbeam
pkgver=0.4
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Gaussian optics simulator"
url="http://gaussianbeam.sourceforge.net/"
license=('GPL')
depends=('qt4>=4.4')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/GaussianBeam-$pkgver/GaussianBeam-$pkgver.tar.bz2)
md5sums=('d79f743f692dce767fe873ef63f5555a')

build() {
  cd $srcdir/GaussianBeam-$pkgver
  qmake
  make

  install -D -m755 GaussianBeam $pkgdir/usr/bin/gaussianbeam
}
