# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>

pkgname=drive-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Google Drive client for the commandline (binary version)"
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
md5sums_x86_64=('01c25e18252cc2090f03ffa636f09c20')
md5sums_arm=('01c25e18252cc2090f03ffa636f09c20')
md5sums_armv6h=('01c25e18252cc2090f03ffa636f09c20')
md5sums_armv7h=('01c25e18252cc2090f03ffa636f09c20')
md5sums_aarch64=('01c25e18252cc2090f03ffa636f09c20')

package() {
	install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/drive
}
