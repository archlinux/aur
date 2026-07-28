# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>
pkgname=pacterm
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal pacman game by Wael"
arch=('x86_64')
url="https://wael.work.gd/arch/pacterm"
license=('GPL3')
source=("pacterm-${pkgver}::https://wael.work.gd/arch/pacterm/bin/${pkgver}/pacterm")
sha256sums=('4ffee88263f63bfb2015faf06ce84cae314d6359d120a4f34c0b3766fef9ee9b')
options=('!strip' '!debug')

package() {
    install -Dm755 "${srcdir}/pacterm-${pkgver}" "${pkgdir}/usr/bin/pacterm"
}
