# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=navi
pkgdesc="An interactive cheatsheet tool for the command-line"
pkgver=0.18.3
pkgrel=1
arch=("any")
url="https://github.com/denisidoro/navi"
license=("AGPL-3.0")
depends=('fzf')
source=("https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha512sums=('cf4a48a6e6e328b7008ff47168448921349920c0e5919c8af6ef9c3c11c9fec0f42fd7c5406c3e536f714962f1eba2cb8ded76bcf401ac0c1fc8b03bc1b1348c')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -ra ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../navi "${pkgdir}/usr/bin/navi"
}
