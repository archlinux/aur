# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate-bin
pkgver=4.14.1
pkgrel=1
pkgdesc=" Pupdate, a thing for updating your Analogue Pocket, binary release"
provides=("pupdate")
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
license=("Apache")

source=(
    "${pkgname}-${pkgver}.zip::https://github.com/mattpannella/pupdate/releases/download/${pkgver}/pupdate_linux.zip"
)

sha256sums=('e75fdbdd307ef13cd9fcece2baccef194dd79b08837f2f718860c3af19f62f85')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/pupdate" "${pkgdir}/usr/bin/pupdate"
}
