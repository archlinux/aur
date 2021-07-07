# Maintainer: LordofNoob <leginee [at] gmail (dot) com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=epm
arch=('i686' 'x86_64')
pkgver=5.0.0
pkgrel=1
pkgdesc="EPM Package manager generates software and patch distributions Packages in various formats from a list of files."
license=('Apache')
url="https://jimjag.github.io/epm/"
source=("https://github.com/jimjag/epm/archive/v5.0.0.tar.gz")
md5sums=('8ce02a315807bd406b5de85ccf63e7fb')
depends=('fltk-mod' 'gcc-libs')

build() {
  cd $srcdir/${pkgname}-$pkgver
  ./configure --prefix=$pkgdir/usr
  make
}

#check() {
#  cd $srcdir/${pkgname}-$pkgver
#  make test
#}

package(){
  cd $srcdir/${pkgname}-$pkgver
  make -i install

}
