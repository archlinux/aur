# Maintainer: Sumit Sahrawat <archlinux at sums dot rs>

provides=('anime4k')
conflicts=()
pkgver=3.1
pkgname=anime4k
pkgrel=2
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
arch=('any')
depends=()
makedepends=()
url="https://github.com/bloc97/Anime4K#anime4k"
options=()
license=('MIT')
source=("https://github.com/bloc97/Anime4K/releases/download/${pkgver}/Anime4K_v${pkgver}.zip")
sha512sums=('4dfc3e1a54167797f1d9b61e2a74bd0a2cfa0065a505b05aaa8655ebf1189bad5d9c25dce28d452593f800c6ef149c3aa867e59a5ac15931308b5bfa372a6bc2')

package() {
    install -Dm644 -t "${pkgdir}"/usr/share/anime4k "${srcdir}"/*.glsl
}
