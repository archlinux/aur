# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='superglue'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='Tool for write a small file to the beginning of a large file in place'
arch=("x86_64")
url='https://github.com/VHSgunzo/superglue'
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
