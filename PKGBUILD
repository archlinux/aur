# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='importenv-bin'
pkgver='0.0.6'
pkgrel='1'
pkgdesc='Launching an executable file with environment variables from a specific process id'
arch=("x86_64")
url='https://github.com/VHSgunzo/importenv'
source=("${pkgname%-bin}::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}" ; }
