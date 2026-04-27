# Maintainer: fmitesh007 <markhackit@gmail.com>
pkgname=springcraft
pkgver=0.3.1
pkgrel=1
pkgdesc="Modern CLI scaffolder for Spring Boot projects"
arch=('x86_64')
url="https://github.com/fmitesh007/springcraft-cli"
license=('MIT')
depends=('glibc')
source=("https://github.com/fmitesh007/springcraft-cli/releases/download/v${pkgver}/springcraft-linux")
sha256sums=('eb61110343bf48d47179b572fb8f189420a0f9b89177f833319ea1222a619933')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
