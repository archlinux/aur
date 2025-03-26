# Maintainer: thirdwinter thirdwinters@gmail.com
pkgname=foamshot
pkgver=v0.1.1
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
source=("https://github.com/Thirdwinter/foamshot/releases/download/$pkgver/$pkgname-linux-x86_64")
noextract=()
sha256sums=("2b32b0b1d4c41f34045611ea84a56f98ee0d276575979a2407a7a75853784793")
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
    install -Dm755 "$srcdir/$pkgname-linux-x86_64" "$pkgdir/usr/bin/$pkgname"
}
