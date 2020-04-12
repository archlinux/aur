# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sauce-finder
pkgver=2.0.0
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/sauce-finder"
license=('GPL3')
groups=()
depends=("python-requests")
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
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
noextract=()
sha256sums=('85fcf79bfe9e42622ab1bb69533021144c0c6f4f47874dbecaf003e011edc382')

build() {
	cd "$pkgname-v$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-v$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
