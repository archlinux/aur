# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=navi
pkgdesc="An interactive cheatsheet tool for the command-line"
pkgver=0.17.0
pkgrel=1
arch=("any")
url="https://github.com/denisidoro/navi"
license=("AGPL-3.0")
depends=('fzf')
source=("https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha512sums=('a8c25ea8ecb581719934ec717c9697f1a2f7e764c97f36383c55dc99fd8f464b1e759b02e9394393a9296b7b76a980e96042242591596762cd72687de8ee7e60')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -ra ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../navi "${pkgdir}/usr/bin/navi"
}
