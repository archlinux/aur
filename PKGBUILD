# Maintainer: Sumit Sahrawat <archlinux at sums dot rs>

provides=('anime4k')
conflicts=()
pkgver=3.2
pkgname=anime4k
pkgrel=1
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
arch=('any')
depends=()
makedepends=()
url="https://github.com/bloc97/Anime4K#anime4k"
options=()
license=('MIT')
source=("https://github.com/bloc97/Anime4K/releases/download/v${pkgver}/Anime4K_v${pkgver}.zip")
sha256sums=('06c798a52d155c534b1bc88eff9db495bc83ab9be431759879c519d2d9e4ebdc')

package() {
    install -Dm644 -t "${pkgdir}"/usr/share/anime4k "${srcdir}"/*.glsl
}
