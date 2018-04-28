# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
pkgname=qldv
pkgver=0.3
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
source=('https://github.com/kirbyfan64/qldv/archive/v0.3.tar.gz')
sha256sums=('6887bbd5a647629aac0877666bc302c0dedcef0178693173471f729de4b7f8ae')

package() {
	make install -C "$srcdir/qldv-$pkgver" DESTDIR="$pkgdir" PREFIX="/usr"
}
