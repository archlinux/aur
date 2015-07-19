# Maintainer: lothar_m <lothar_m at riseup dot net>
_pkgname=ofxclient
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Simple ofxclient command line utility and OFX client libraries for development."
arch=('x86_64' 'i686')
url="https://github.com/captin411/ofxclient"
license=('MIT')
depends=('python2.7')
# makedepends=()
source=('ofxclient::git+https://project_url#branch=project_branch')
md5sums=('SKIP')

build() {
	cd "$srcdir/ofxclient-$pkgver"
	python2 setup.py build
}

package() {
	# install package
	cd "$srcdir/ofxclient-$pkgver"
	python2 setup.py install --root="$pkgdir/"
}

