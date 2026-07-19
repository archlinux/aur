# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate-bin
pkgver=5.3.2
pkgrel=2
pkgdesc=" Pupdate, a thing for updating your Analogue Pocket, binary release"
provides=("pupdate")
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
license=("Apache")
depends=('gcc-libs')

source=(
    "${pkgname}-${pkgver}.zip::https://github.com/mattpannella/pupdate/releases/download/${pkgver}/pupdate_linux.zip"
)

sha256sums=('5cee292285474b2d0d404224a9787e7dcfa6ae92443517a1596fae8d5d2fefba')


package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/pupdate" "${pkgdir}/usr/bin/pupdate"
}
