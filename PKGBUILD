# Maintainer: thirdwinter thirdwinters@gmail.com
pkgname=foamshot-bin
pkgver=v0.1.2
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
sha256sums=("ddef30da2add8c80978f615665086ebc54481c9aeda89d5ecb2f66d39814bdb4")
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
