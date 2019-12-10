# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=git-rename
pkgver=1.0.0
pkgrel=2
pkgdesc="Easily rename a branch, locally and on the remote"
arch=('any')
url="https://github.com/sudoforge/${pkgname}"
license=('MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4e874f10a5d38a2517f7e13abf1d3d04390d58d021ca59a10c0dbb4fa700a5ac')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
