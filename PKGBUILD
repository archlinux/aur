# Maintainer: insaanimanav <mail@manav.co.in>
pkgname=tumpa-git
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Tumpa is a desktop application that makes OpenPGP key creation and smart card access easier. No more terminals, no more typing and entering options multiple times. All you need to do is fill up a few fields, and click a few ti    mes"
arch=('any')
url="https://github.com/kushaldas/tumpa"
license=('GPL','AGPL')
depends=()
makedepends=(python python-pip git)
provides=(tumpa)
source=("git+https://github.com/kushaldas/tumpa.git")
prepare() {
	cd 
}
build() {
	cd "$srcdir/tumpa"
	python setup.py build
}
package() {
	cd "$srcdir/tumpa"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	}
md5sums=('SKIP')
