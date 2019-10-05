# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=navi
pkgdesc="An interactive cheatsheet tool for the command-line"
pkgver=0.11.1
pkgrel=1
arch=("any")
url="https://github.com/denisidoro/navi"
license=("AGPL-3.0")
depends=('fzf')
source=("https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha512sums=('8641df343d6bdcef23fa60e056a74c4b8e42a9a3d1857f4ae12ba913149d01087ac54c495a8db82920ab743e93ee7534fc23916ccd8260141d731f277fdce768')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -ra ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../navi "${pkgdir}/usr/bin/navi"
}
