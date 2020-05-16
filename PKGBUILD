# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=legendary
pkgver=0.0.12
pkgrel=1
pkgdesc="A free and open-source replacement for the Epic Games Launcher "
arch=('any')
url="https://github.com/derrod/legendary"
license=('GPL3')
groups=()
depends=("python-requests" "python-wheel" "python-setuptools")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('83732db82a344195e10b39fe5a5925a32daf96599a03d3ed7e86d786f4b56bb2')

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
