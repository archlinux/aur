# Maintainer: pikl <me@pikl.uk>
_pkgroot=typesense
pkgname="${_pkgroot}-bin"
pkgver=0.25.0
pkgrel=1
epoch=
pkgdesc="A fast, typo-tolerant search engine for building delightful search experiences."
arch=('x86_64')
url="https://github.com/typesense/typesense"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgroot}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://dl.typesense.org/releases/${pkgver}/${_pkgroot}-server-${pkgver}-linux-amd64.tar.gz")
noextract=()
sha256sums=('fc40c361a18fe372ee3aaf74571f33fdf9a9e28ba0cae8933f52f90e640f6744')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }
# 
# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }
# 
check() {
    echo "example error"
    exit 1
}

package() {
    :
	# cd "$pkgname-$pkgver"
	# make DESTDIR="$pkgdir/" install
}

