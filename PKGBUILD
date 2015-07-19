# Maintainer: lothar_m <lothar_m at riseup dot net>
_pkgname=ofxhome
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="."
arch=('x86_64' 'i686')
url="https://github.com/captin411/ofxclient"
license=('MIT')
depends=('python2>=2.7'
		)
# makedepends=()
provides=(ofxhome)
conflicts=(ofxhome)
source=('ofxhome::git+https://github.com/captin411/ofxhome.git#branch=master')
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	python2 setup.py build
}

package() {
	# install package
	cd "$srcdir/$_pkgname"
	python2 setup.py install --root="$pkgdir/"
}

