# Maintainer: srgooglo <srgooglo@ragestudio.net>
pkgname=comty-desktop-bin
pkgver="0.4.0"
_pkgver="0.4.0"
pkgrel=1
pkgdesc="Official Comty Desktop application bin"
arch=("x86_64")
url="https://github.com/ragestudio/comty"
license=("MIT")
source=("https://storage.ragestudio.net/comty-releases/linux/comty-desktop_${_pkgver}_amd64.deb")
sha256sums=("94b7f88d15e2d6613df60d6cc865bf173ebc5dba65c079b6f22e67f59e1b3920")

package() {
    echo "Extracting data.tar.xz ..."
    bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }
