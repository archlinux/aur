# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>

pkgname=drive-bin
pkgver=0.3.9
pkgrel=1
pkgdesc=""
arch=("x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/odeke-em/drive"
license=('APACHE')
provides=("drive")
conflicts=("drive")
_url="$pkgname-$pkgver::https://github.com/odeke-em/drive/releases/download/v$pkgver/drive"
source_x86_64=("${_url}_linux")
source_arm=("${_url}_armv5")
source_armv6h=("${_url}_armv6")
source_armv7h=("${_url}_armv7")
source_aarch64=("${_url}_armv8")
md5sums_x86_64=("a192d38419377aa27a45d90055c56a14")
md5sums_arm=("990d899bdff2e54cd401ece624a4f8be")
md5sums_armv6h=("812689b6bb2113948c8394854bbde47f")
md5sums_armv7h=("222be8926c35353f81baba014d926c71")
md5sums_aarch64=("ecc56e8df5af018eab40097d261e862d")

package() {
	install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/drive
}
