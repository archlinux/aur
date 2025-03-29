# Maintainer: thirdwinter thirdwinters@gmail.com
pkgname=foamshot-bin
pkgver=v0.1.3
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
sha256sums=("dd3706593eda0e78aa4e11be6b8d87d9db95b135f5dda124b7151bcc4e643eeb")
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
