# Maintainer: Ben DeCamp <ben_decamp@outlook.com>
pkgname=asmx
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Multi-CPU Assembler"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://xi6.com/projects/asmx/"
license=()
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
source=("http://xi6.com/files/asmx-$pkgver.zip")
noextract=()
md5sums=('1ae9e1d7b6ff14a5ce564682e2b58d9f')

package() {
    make INSTALL_DIR="$pkgdir/usr/local/bin/" install
}
