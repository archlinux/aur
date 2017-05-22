# Mantainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>


pkgname=wxmacmolplt
pkgver=7.7
pkgrel=1
pkgdesc="An open-source gui for preparing, submitting and visualizing input and output for the GAMESS quantum chemistry package."
url="https://brettbode.github.io/wxmacmolplt/"
license=("GPL2")
arch=(i686 x86_64)
depends=('wxgtk' 'glew')
source=(https://uofi.box.com/shared/static/7pzccnku3uv0mmf6il6yiqghf4b34lc7.gz)

sha1sums=('dfcfaf2285f43d03e41349a566d501bcea582a75')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install
}


