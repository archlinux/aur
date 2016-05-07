# Maintainer: Brian Steffens <briansteffens@gmail.com>
pkgname=mkws
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Quickly generate throwaway development environments for quick tests, calculations, etc."
arch=('i686' 'x86_64')
url="https://github.com/briansteffens/mkws"
license=('GPL')
groups=()
depends=("python" "python-docopt")
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
source=("${pkgname%-*}::git+https://github.com/briansteffens/mkws.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
