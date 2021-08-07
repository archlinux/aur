# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

pkgname=fuzzy-pdf-bin
_pkgname=fuzzy-pdf
pkgver=0.3.6
pkgrel=1
pkgdesc='Fuzzy finder for a collection of pdf files'
arch=('x86_64')
url='https://github.com/MarioJim/fuzzy-pdf'
license=('GPL3')
depends=('poppler-glib')
provides=('fuzzy-pdf')
conflicts=('fuzzy-pdf')
source=("${_pkgname}::${url}/releases/download/v${pkgver}/fuzzy-pdf")
sha256sums=('ebb0b219eda3e9b2b2305149823f08cd220f58f3d65fe9d1ad79fd8c014051dd')

package() {
    install -Dm 755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin"
}
