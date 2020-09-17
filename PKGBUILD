# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=codechef-cli
pkgver=0.5.3
pkgrel=1
pkgdesc="CodeChef Command Line Client."
arch=('any')
url="https://github.com/sk364/codechef-cli"
license=('GPL3')
groups=()
depends=("python-requests-html")
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('87763b117ae1970d31920a86646413713ea6fc09eddc4fca8a76ef8c84d379f9')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
