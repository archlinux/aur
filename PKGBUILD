# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='lsvkdev'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Show Vulkan deviceName and driverName on Rust'
arch=("x86_64")
url='https://github.com/VHSgunzo/lsvkdev'
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
