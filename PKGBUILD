# Maintainer: Wtz_LASR <wtz_lasr@outlook.com>
# Contributor: KEKE <KEKE_046@pku.edu.com>
_scalaver=3.1
pkgname=ammonite-scala$_scalaver
pkgver=2.5.4
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
b2sums=("104190bae8ae6d8efe3b3d43932ecf5f5075516b706dffca04a1fc3710edc476b2042b8b50036fd7719207dabd0771e3239030e866b48adad14a901d155c15c0")
validpgpkeys=()

package() {
    mkdir $pkgdir/usr/bin -p
	cp $srcdir/amm-$_scalaverhort $pkgdir/usr/bin/amm-$_scalaverhort
    chmod +x $pkgdir/usr/bin/amm-$_scalaverhort
}
