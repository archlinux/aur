pkgname=htmlcxx
pkgver=0.84
pkgrel=1
pkgdesc="A simple non-validating css1 and html parser for C++."
arch=('i686' 'x86_64')
url="http://htmlcxx.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=('subversion')
conflicts=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
provides=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
source=(http://kent.dl.sourceforge.net/project/htmlcxx/htmlcxx/0.84/htmlcxx-0.84.tar.gz)
md5sums=(d2e0e6f4c509ef1809d90dd21c3ba3e8)

build() {
	cd $startdir/src/htmlcxx-0.84
	
	./configure --prefix=/usr
	
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
