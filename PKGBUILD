# Maintainer: fmitesh <markhackit@gmail.com>

pkgname=springcraft
pkgver=0.3.0
pkgrel=1
pkgdesc="Modern CLI scaffolder for Spring Boot projects - like Vite but for Spring"
arch=('x86_64')
url="https://github.com/fmitesh007/springcraft-cli"
license=('MIT')
depends=()
source=("https://github.com/fmitesh007/springcraft-cli/releases/download/v${pkgver}/springcraft-linux")
sha256sums=('c4443abd937afc932a9abdfd76703c6acdff09203d1033ebd65263d77118d117')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
