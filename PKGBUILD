# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-runtest
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="Numerically tolerant end-to-end test library for research software."
arch=("x86_64")
url="https://runtest.readthedocs.io"
license=("Mozilla Public License version 2.0")
groups=()
depends=(python)
makedepends=()
checkdepends=()
optdepends=()
provides=(python-parselglossy)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/bast/runtest/archive/v2.2.0.tar.gz")
noextract=()
sha256sums=("818fc71cbce9e4714098cf24406999b2077a0eaf51dfa69a493dc8cc04a5392c")
validpgpkeys=()

package() {
	cd "$srcdir/${pkgname#"python-"}-${pkgver//_/-}"
	python setup.py install --root="$pkgdir" 
}
