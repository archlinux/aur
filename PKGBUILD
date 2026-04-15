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
sha256sums=('d900a37ccfb4ede2db43a6284b64d50786cc663fdfecb8280c86e34acd2eebfe')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
