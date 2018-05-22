# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
pkgname=qldv
pkgver=0.3.1
pkgrel=1
pkgdesc="create a patched ld-linux.so without version information warnings"
arch=('i686' 'x86_64')
url="https://github.com/kirbyfan64/qldv"
license=('BSD')
groups=()
depends=('binutils' 'coreutils' 'glibc' 'patchelf')
makedepends=()
provides=('qldv')
conflicts=('qldv-git')
replaces=()
backup=()
options=()
install=
source=("https://github.com/kirbyfan64/qldv/archive/v$pkgver.tar.gz")
sha256sums=('a36116e365c2cdd9f3f0396a0a46898bf9415d96e36a31fe2dca996cf85fb656')

package() {
	make install -C "$srcdir/qldv-$pkgver" DESTDIR="$pkgdir" PREFIX="/usr"
}
