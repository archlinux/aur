# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=font-validator
pkgrel=1
pkgver=2.1.6
pkgdesc="The Font Validator validates fonts."
url="https://github.com/HinTak/Font-Validator"
arch=('x86_64')
license=('MIT')
install=''
source=(
    "${pkgname}-${pkgver}.tgz::https://github.com/HinTak/Font-Validator/releases/download/FontVal-${pkgver}/FontVal-${pkgver}-ubuntu-18.04-x64.tgz"
)
sha256sums=('244997841192659b0c8f66c8766b048ca05f510f6ca771eca957045867b811a5')
depends=('gzip')
options=(!strip)

package() {
    install -D -m 755 "${srcdir}/FontVal-${pkgver}-ubuntu-18.04-x64/FontValidator-ubuntu-18.04-x64" "${pkgdir}/usr/bin/FontValidator"
}
