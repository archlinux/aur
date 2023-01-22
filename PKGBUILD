# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='importenv'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='Launching an executable file with environment variables from a specific process id'
arch=("x86_64")
url='https://github.com/VHSgunzo/importenv'
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('e43c60bf1c620abf858304628ec01f005af1727515f20c1b8b74b80fbb31e89e')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
