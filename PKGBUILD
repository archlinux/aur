pkgname=python2-xmltramp
pkgver=2.18
pkgrel=2
pkgdesc="xmltramp is a simple Pythonic API for working with XML documentation"
arch=('i686' 'x86_64')
makedepends=('python2-distribute')
url="http://www.aaronsw.com/2002/xmltramp/"
license=('GPL2')
depends=('python2')
source=('http://www.aaronsw.com/2002/xmltramp/xmltramp.py')
md5sums=('12d232c0bd6ef8ffbd16da760ad0ba6f')

package() {
  python2_sitelib=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")
  install -Dm644 "$srcdir/xmltramp.py" "$pkgdir/${python2_sitelib}/xmltramp.py"
}
