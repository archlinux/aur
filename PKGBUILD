# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sauce-finder
pkgver=2.2.3
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/$pkgname"
license=('GPL3')
groups=()
depends=("python-requests" "python-validators" "python-click")
makedepends=("python-setuptools")
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
sha256sums=('96181a6b926ecc84d7637657b92063974f3a8379102a999f280e0bf6c1efa96d')

build() {
	cd "$pkgname-v$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-v$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
