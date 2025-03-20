# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=vimix-kanagawa-cursors
pkgver=1.0.0
pkgrel=1
pkgdesc="Kanagawa recolour of the Vimix cursor theme by vinceliuice"
arch=(any)
url="https://github.com/walldmtd/vimix-kanagawa-cursors"
license=("GPL-3.0-or-later")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9aedac567a8e6cefa7967e9e9f5607c9e735ddfba5e5748b544ac88b54818b26f93d3107e486a9e8446fb000d18ab95ba449c1340b9c6601acdf347a3a5bd917')

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}"/usr/share/icons/{"${pkgname}",vimix-kanagawa-lotus-cursors}
    cp -dr --no-preserve=ownership dist/* "${pkgdir}/usr/share/icons/${pkgname}"
    cp -dr --no-preserve=ownership dist-lotus/* "${pkgdir}/usr/share/icons/vimix-kanagawa-lotus-cursors"
}
