# Contributor: danitool<dgcbueu[at]gmail.com>, Henrik Nymann Jensen <h@henriknj.dk>

pkgname=revoco
pkgver=0.6
pkgrel=3
_commit=1312012b6f533fabfb8cd5b76d39508d0a909fee
pkgdesc="Change the wheel behaviour of Logitech's MX-Revolution mouse."
arch=('i686' 'x86_64')
url="https://github.com/sebastien/revoco"
license=()
conflicts=('revoco2')
source=(https://github.com/sebastien/$pkgname/archive/$_commit.zip)
md5sums=('4a6294412e7649240b1eb222e6c73326')

build() {
  cd $srcdir/$pkgname-$_commit
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$_commit
  install -D -m755 revoco $pkgdir/usr/bin/revoco
}
