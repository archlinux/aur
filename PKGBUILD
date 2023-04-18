# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-py-slvs
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://github.com/realthunder/slvs_py"
license=()
groups=()
depends=("python" "swig")
makedepends=("python-setuptools" "python-scikit-build" "cmake" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://github.com/realthunder/slvs_py/archive/refs/tags/v1.0.5.tar.gz')
noextract=()
md5sums=('eab7e36a0ac0ed5147aef7044c0100a6')
validpgpkeys=()

build() {
	cd "$srcdir/slvs_py-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/slvs_py-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
