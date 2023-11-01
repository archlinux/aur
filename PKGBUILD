pkgname=python-flagser
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="A library that helps you create flags for your python program"
arch=('any')
url="https://github.com/spynetS/flagser"
license=('MIT')
groups=()
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	git clone $url	
}

build() {
	echo "BUILD"
	cd flagser
	python setup.py build
}

package() {
	echo "PKG"
	cd flagser
	python setup.py install --root="$pkgdir" --optimize=1
}
