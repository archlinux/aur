pkgname=perl-gedcomlite
_pkgname=perl-Gedcomlite
_suffix=2.noarch.rpm
pkgver=1.16
_pkgver=0.3.17
pkgrel=3
pkgdesc="Gedcomlite - a perl module to manipulate Gedcom genealogy files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rodovid/"
license=('GPL')
depends=('perl')
source=(http://sourceforge.net/projects/rodovid/files/${_pkgver}/linux/rpm/${_pkgname}-${pkgver}-${_suffix})
package() {
  cd $srcdir
  cp -r usr $pkgdir/
}
md5sums=('3f6d631fbb2496bcbef4535f5f34287a')
