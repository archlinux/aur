# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-parselglossy
pkgver=0.3.0_alpha1
pkgrel=1
epoch=
pkgdesc="Generic input parsing library, speaking in tongues."
arch=("x86_64")
url="https://parselglossy.readthedocs.io"
license=("MIT")
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
source=("https://github.com/dev-cafe/parselglossy/archive/v0.3.0-alpha1.tar.gz")
noextract=()
sha256sums=("76572c1a0629491b75a78448f4d247d0b7308d41fafcc1708d8be13204a11e31")
validpgpkeys=()

package() {
	cd "$srcdir/${pkgname#"python-"}-${pkgver//_/-}"
	python setup.py install --root="$pkgdir" 
}
