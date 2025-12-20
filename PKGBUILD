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

sha256sums=('4fa1ec563d9ee8b5ac321f79432b4ace9690af3b045336b768efdd24f12c01a0')

package() {
    install -Dm755 "${srcdir}/timemap-linux" "${pkgdir}/usr/bin/timemap"
}
