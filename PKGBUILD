# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='lsvkdev-bin'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Show Vulkan deviceName and driverName on Rust'
arch=("x86_64")
url='https://github.com/VHSgunzo/lsvkdev'
source=("${pkgname%-bin}::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}" ; }
