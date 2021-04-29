# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=posix-manpages
pkgver=2017
pkgrel=1
epoch=
pkgdesc="Posix ManPages for userland coreutils and more, use 'man (0/1/3)p command' to open the man page"
arch=('any')
url="https://www.kernel.org/doc/man-pages/download.html"
license=('GPL')
groups=()
depends=()
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
source=(git+"https://git.kernel.org/pub/scm/docs/man-pages/man-pages-posix.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


package() {
	cd $srcdir/man-pages-posix/man-pages-posix-2017/
	make DESTDIR=$pkgdir/ install
}
