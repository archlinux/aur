# Maintainer: thirdwinter thirdwinters@gmail.com
pkgname=foamshot-bin
pkgver=v0.2.0
pkgrel=1
epoch=
pkgdesc="foamshot is wayland screenshot utility build by rust"
arch=('x86_64')
url="https://github.com/Thirdwinter/foamshot"
license=('MIT')
groups=()
depends=('wl-clipboard')
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
source=("https://github.com/Thirdwinter/foamshot/releases/download/$pkgver/foamshot-linux-x86_64")
noextract=()
sha256sums=("ca4aa70eef52e509a99da749701f23d87161d08c644b377f452eed3b4346c6be")
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }
#
# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }
#
# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
    install -Dm755 "$srcdir/foamshot-linux-x86_64" "$pkgdir/usr/bin/foamshot"
}
