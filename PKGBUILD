# Maintainer: fmitesh007 <markhackit@gmail.com>
pkgname=springcraft
pkgver=0.3.0
pkgrel=2
pkgdesc="Modern CLI scaffolder for Spring Boot projects"
arch=('x86_64')
url="https://github.com"
license=('MIT')
depends=('glibc')
source=("https://github.com/releases/download/v${pkgver}/springcraft-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
