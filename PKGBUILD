pkgname=pacterm-bin
pkgver=1.3.8
pkgrel=1
pkgdesc="A terminal pacman game by Wael (pre-compiled binary)"
arch=('x86_64')
url="https://wael.work.gd/arch/pacterm"
license=('GPL-3.0-or-later')
provides=('pacterm')
conflicts=('pacterm')
source=("pacterm-${pkgver}::https://wael.work.gd/arch/pacterm/bin/${pkgver}/pacterm")
sha256sums=('9244ef827f41a8eb3e3a8eaf1af7891a4bf2aca4e7ae240bbd003fb124e811cd')

package() {
    install -Dm755 "${srcdir}/pacterm-${pkgver}" "${pkgdir}/usr/bin/pacterm"
}
