# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>


pkgname=wxmacmolplt
pkgver=7.6
pkgrel=1
pkgdesc="A moder graphics program for plotting 3-D molecular structures and normal modes"
url="http://www.scl.ameslab.gov/MacMolPlt/"
license=("GPL2")
arch=(i686 x86_64)
depends=('wxgtk' 'glew')
source=(https://bintray.com/artifact/download/brettbode/generic/$pkgname-$pkgver.tar.gz)

sha1sums=('9794f294736c8f61cf3c73c2fb7bfb56dae040d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}


