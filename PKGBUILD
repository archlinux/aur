# Maintainer: Jenil
pkgname=arch-torification
pkgver=1.0
pkgrel=1
pkgdesc="A tool for full system torification of Arch Linux"
arch=('x86_64')
url="https://github.com/jenil1122/Arch-torification"
license=('GPL')
source=("https://github.com/jenil1122/Arch-torification/releases/download/${pkgver}/arch-torification")
sha256sums=('SKIP')
conflicts=("arch-torification")
export LDFLAGS+=" -Wl,-z,relro,-z,now"


package() {
    install -Dm755 arch-torification "${pkgdir}/usr/bin/arch-torification"
    hash -r
}
