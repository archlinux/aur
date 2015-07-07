pkgname=rodovid
_suffix=1.noarch.rpm
pkgver=0.3.17
pkgrel=1
pkgdesc="Rodovid is a drag-n-drop genealogic program for Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rodovid/"
license=('GPL')
depends=('perl' 'perl-tk' 'perl-gedcomlite' 'perl-pdf-api2' 'graphviz')
source=(http://sourceforge.net/projects/rodovid/files/$pkgver/linux/rpm/${pkgname}-${pkgver}-${_suffix})
package() {
  cd $srcdir
  cp -r usr $pkgdir/
}
md5sums=('41343911a85a752cdd7356b8b039ba96')
