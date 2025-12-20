# Maintainer: Shurui Liu <srliu3264@gmail.com>
pkgname=timemap-bin
pkgver=1.0
pkgrel=1
pkgdesc="A Terminal-based Diary & Knowledge & Task Calendar Manager (Binary)"
arch=('x86_64')
url="https://github.com/srliu3264/timemap"
license=('MIT')
provides=('timemap')
conflicts=('timemap')
depends=('glibc') 

source=("${url}/releases/download/v${pkgver}/timemap-linux")

sha256sums=('68ac6fa2188b39eddabb4c778601cc47a9010801043c7e1ff6ed719d8963f917')

package() {
    install -Dm755 "${srcdir}/timemap-linux" "${pkgdir}/usr/bin/timemap"
}
