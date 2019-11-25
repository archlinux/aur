# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=navi
pkgdesc="An interactive cheatsheet tool for the command-line"
pkgver=0.15.3
pkgrel=1
arch=("any")
url="https://github.com/denisidoro/navi"
license=("AGPL-3.0")
depends=('fzf')
source=("https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha512sums=('875785e9afb41e6bcc94e1da0bac8a50bd688ef36273194d721e38351bec3c8a13ed879e14aed367ccefcbdb54f3fcc00448c46fdcab9f82933ee7e3a6eae46c')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -ra ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../navi "${pkgdir}/usr/bin/navi"
}
