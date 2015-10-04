# Maintainer: Jakub Pelikan jakub.pelikan@gmail.com
pkgname=create_ap-gui
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Gui application for easy creating access points. Application allows save configuration for quickly create AP."
arch=('any')
url=""
license=('GPL')
groups=()
depends=(
	'python-pip'
	'create_ap'
        'python>=3.5'
        'net-tools'
	)
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
source=("https://pypi.python.org/packages/source/c/create_ap-gui/create_ap-gui-1.1.tar.gz")
noextract=()
md5sums=("474e081c396f9a486dcb4ac13c835854")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver" 
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	python3 setup.py install --root="${pkgdir}" --optimize=1
}

