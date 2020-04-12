# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sauce-finder
pkgver=2.0.1
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/$pkgname"
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
sha256sums=('22093627c60c56230a3ad73d59d3f46ed0eef05935eb3b23221ad713fe8211b2')

build() {
	cd "$pkgname-v$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-v$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
