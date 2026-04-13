# Maintainer: fmitesh <markhackit@gmail.com>

pkgname=springcraft
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern CLI scaffolder for Spring Boot projects - like Vite but for Spring"
arch=('x86_64')
url="https://github.com/fmitesh007/springcraft-cli"
license=('MIT')
depends=()
source=("https://github.com/fmitesh007/springcraft-cli/releases/download/v${pkgver}/springcraft-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
