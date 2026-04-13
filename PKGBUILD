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
sha256sums=('39a27834d8bf5933dc71e2fd4aaf08b16b3069fa7cda169cb935394a17b78b7a')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
