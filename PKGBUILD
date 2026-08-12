pkgname=pacterm-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="A terminal pacman game by Wael (pre-compiled binary)"
arch=('x86_64')
url="https://wael.work.gd/arch/pacterm"
license=('GPL-3.0-or-later')
provides=('pacterm')
conflicts=('pacterm')
source=("pacterm-${pkgver}::https://wael.work.gd/arch/pacterm/bin/${pkgver}/pacterm")
sha256sums=('f38ab87693aacfb8f7bafb6049caf58fc4de772fdbe150ba5a5b05760255dc99')

package() {
    install -Dm755 "${srcdir}/pacterm-${pkgver}" "${pkgdir}/usr/bin/pacterm"
}
