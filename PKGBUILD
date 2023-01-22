# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='importenv'
pkgver='0.0.5'
pkgrel='1'
pkgdesc='Launching an executable file with environment variables from a specific process id'
arch=("x86_64")
url='https://github.com/VHSgunzo/importenv'
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('92bcfcef61c7938b802822489e85f9c92ca4dd25701c0b8f576f833aaedf8e6b')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
