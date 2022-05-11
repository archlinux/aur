# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>

pkgname=drive-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Google Drive client for the commandline (binary version)"
arch=("x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/odeke-em/drive"
license=('APACHE')
provides=("drive")
conflicts=("drive")
_url="https://github.com/odeke-em/drive/releases/download/v$pkgver/drive"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_url}_linux")
source_arm=("${pkgname}-${pkgver}-arm::${_url}_armv5")
source_armv6h=("${pkgname}-${pkgver}-armv6h::${_url}_armv6")
source_armv7h=("${pkgname}-${pkgver}-armv7h::${_url}_armv7")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_url}_armv8")
md5sums_x86_64=('01c25e18252cc2090f03ffa636f09c20')
md5sums_arm=('bda6c82ab14870dbeb1976a07ec5daa3')
md5sums_armv6h=('eb5339e40eefe685836d609fc4c1adcf')
md5sums_armv7h=('8adae2737f7510328a755a11335510e1')
md5sums_aarch64=('d9a406d7f5f1b821173529940f8b5393')

package() {
	install -Dm 755 $pkgname-$pkgver-$CARCH "$pkgdir"/usr/bin/drive
}
