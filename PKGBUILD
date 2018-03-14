# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
pkgname=qldv
pkgver=0.2
pkgrel=1
pkgdesc="create a patched ld-linux.so without version information warnings"
arch=('i686' 'x86_64')
url="https://github.com/kirbyfan64/qldv"
license=('BSD')
groups=()
depends=('binutils' 'coreutils' 'glibc' 'patchelf')
makedepends=('git')
provides=('qldv')
conflicts=('qldv-git')
replaces=()
backup=()
options=()
install=
source=('https://github.com/kirbyfan64/qldv/archive/v0.2.tar.gz')
sha256sums=('7ba604a4493d16b800287cdbd86dd8f545589c97427022b09bcccc1f4946b43e')

package() {
	make install -C "$srcdir/qldv-$pkgver" DESTDIR="$pkgdir" PREFIX="/usr"
}
