# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=navi
pkgdesc="An interactive cheatsheet tool for the command-line"
pkgver=0.9.0
pkgrel=3
arch=("any")
url="https://github.com/denisidoro/navi"
license=("AGPL-3.0")
depends=('fzf')
source=("https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha512sums=('432ea74de9218c1651e0b86669439f8f949cd3ccc582f51999fed3f446a3ee7a2fdb5cb63857b465e6487af1c32a0c81b00eaeb873c0d3a5e37084c4d3664815')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -ra ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../navi "${pkgdir}/usr/bin/navi"
}
