pkgname=moorestech
pkgver=dev_v2.0.0
pkgrel=1
epoch=
pkgdesc="OSS automated industrial game developed in Unity."
arch=('x86_64')
url="https://github.com/moorestech"
license=('Apache')
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
source=("https://github.com/moorestech/moorestech_client/releases/download/dev-v2.0.0/moorestech-linux.tar")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
        cp -r "$srcdir/$pkgname-$pkgver"
        cd "$pkgdir"
        tar -xf moorestech.tar
        rm moorestech.tar
}
