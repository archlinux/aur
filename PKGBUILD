# Maintainer: Lenovsky <lenovsky@pm.me>

pkgname=ipman
pkgver=0.1.0
pkgrel=1
pkgdesc="Allows managing Lenovo Ideapad battery charging thresholds"
arch=('any')
url="https://github.com/Lenovsky/${pkgname}"
license=('custom:unlicense')
depends=('bash')
source=("https://github.com/Lenovsky/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b0dce7038c64619f69562e956f49a20c85dd01b60f6f480215574884e8a5486c')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
