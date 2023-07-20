# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='superglue-bin'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='Tool for write a small file to the beginning of a large file in place'
arch=("x86_64")
url='https://github.com/VHSgunzo/superglue'
source=("${pkgname%-bin}::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}" ; }
