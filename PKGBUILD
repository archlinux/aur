# Maintainer: Lai Jiang <jianglai@msn.com>

pkgname=plezy-bin
pkgver=1.26.1
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
arch=('x86_64')
url="https://github.com/edde746/plezy"
license=('GPL-3.0-or-later')
depends=()
source=("plezy-1.26.1.pkg.tar.zst::https://github.com/edde746/plezy/releases/download/1.26.1/plezy-linux-x64.pkg.tar.zst")
sha256sums=('98b050135c7172c5cfed17ebd450e2fb97043d0f47fec0d7cb580c18b7556057')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

package() {
    cd "${srcdir}"

    # Copy opt and usr directories from the extracted Arch package
    cp -r opt "${pkgdir}/"
    cp -r usr "${pkgdir}/"
}
