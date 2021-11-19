# Maintainer: KEKE <KEKE_046@pku.edu.com>
_scalaver=3.0
pkgname=ammonite-scala$_scalaver
pkgver=2.4.1
pkgrel=1
_scalaverhort=${_scalaver//./}
epoch=
pkgdesc="ammonite with scala $_scalaver"
arch=('x86_64')
url="https://github.com/com-lihaoyi/Ammonite"
license=('MIT')
groups=("ammonite-scala")
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
source=("amm-$_scalaverhort::https://github.com/com-lihaoyi/Ammonite/releases/download/$pkgver/$_scalaver-$pkgver")
noextract=("amm-$_scalaverhort")
md5sums=("10d0ce7af9ea3ff9d48ea5a5ab16cef0")
validpgpkeys=()

package() {
    mkdir $pkgdir/usr/bin -p
	cp $srcdir/amm-$_scalaverhort $pkgdir/usr/bin/amm-$_scalaverhort
    chmod +x $pkgdir/usr/bin/amm-$_scalaverhort
}
