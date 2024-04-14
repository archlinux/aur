# Maintainer: uzvg <1497911983@qq.com>
pkgname=rime-uggx
pkgver=1.4.0
pkgrel=1
# epoch=
pkgdesc="一个用于 RIME 的郑码输入方案"
arch=(any)
url="https://github.com/X1aomu/rime-uggx"
license=('unknown')
# groups=()
depends=('rime-pinyin-simp' 'rime-emoji')
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install= 
# changelog=
# https://github.com/X1aomu/rime-uggx/archive/refs/tags/v1.4.0.tar.gz
# source=("https://github.com/X1aomu/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/X1aomu/$pkgname/archive/v$pkgver.tar.gz")
# noextract=()
sha256sums=('64815629c0d3c94c9a94efa4e544312fc1b1791b4127768b5fa755f85b1eb18f')
# validpgpkeys=()

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
	cd "$pkgname-$pkgver"
    install -Dm644 *.yaml -t "$pkgdir/usr/share/rime-data/"
    # cd ${pkgdir}
	# make DESTDIR="$pkgdir/" install
}