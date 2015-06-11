# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=cloc-svn
pkgver=1.62
pkgrel=1
pkgdesc="Count Lines of Code, svn version"
url="http://cloc.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl')
makedepends=('subversion')
conflicts=('cloc')
source=("svn+http://svn.code.sf.net/p/cloc/code/trunk")
md5sums=('SKIP')

build() {
    cd $srcdir/trunk/
    make
}

package() {
    cd $srcdir/trunk/
    make DESTDIR="$pkgdir" install
}
