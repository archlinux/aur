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
sha256sums=('6f6e27559dd995aa81519e19f4c3a96cbb3426b9a3ad7963cf54b323a3de18c7')

package() {
    install -Dm755 "${srcdir}/springcraft-linux" "${pkgdir}/usr/bin/springcraft"
}
