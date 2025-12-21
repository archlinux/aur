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

sha256sums=('ede1ab5a69ea2e1e0ae5746ac36d3cf5d7a07af8b297a6b37403b64c3e85206a')

package() {
    install -Dm755 "${srcdir}/timemap-linux" "${pkgdir}/usr/bin/timemap"
}
