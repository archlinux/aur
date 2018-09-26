# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=git-rename
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily rename a branch, locally and on the remote"
arch=('any')
url="https://github.com/sudoforge/${pkgname}"
license=('MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cc6218816f63dcd65c79ae90bcc1e272a7246373993c0dc7e70d09fb66347fe8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
