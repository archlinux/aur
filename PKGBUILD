# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate-bin
pkgver=4.4.1
pkgrel=1
pkgdesc=" Pupdate, a thing for updating your Analogue Pocket, binary release"
provides=("pupdate")
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
license=("Apache")

source=(
    "${pkgname}-${pkgver}.zip::https://github.com/mattpannella/pupdate/releases/download/${pkgver}/pupdate_linux.zip"
)

sha256sums=('fbfcf7a76cb6635f9bfbf14a8c9f6b7c9bbf4fcd3e60a1cd1b880378a89363db')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/pupdate" "${pkgdir}/usr/bin/pupdate"
}
