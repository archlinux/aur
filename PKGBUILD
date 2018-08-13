# Maintainer: Ben DeCamp <ben_decamp@outlook.com>
pkgname=asmx
pkgver=2.0b5
pkgrel=1
epoch=
pkgdesc="Multi-CPU Assembler"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://xi6.com/projects/asmx/"
license=()
groups=()
depends=()
makedepends=('patch')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://xi6.com/files/asmx-$pkgver.zip"
        "Makefile.patch")
noextract=()
md5sums=('9e9125592d12bfae1b0b8015f32dcc5b'
         '5d28a84fca8c75a77d8bb7009d226cf2')

prepare() {
	patch $srcdir/src/Makefile Makefile.patch
}

package() {
    make INSTALL_DIR="$pkgdir/usr/local/bin/" install
}
