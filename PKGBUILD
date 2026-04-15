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
sha256sums=('3e16365296a32e2b6c93786884d24508800eeeb41c5d6eef029b6f48d845b24e')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
