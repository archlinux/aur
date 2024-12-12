# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate-bin
pkgver=4.1.4
pkgrel=1
pkgdesc=" Pupdate, a thing for updating your Analogue Pocket, binary release"
provides=("pupdate")
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
license=("Apache")

source=(
    "https://github.com/mattpannella/pupdate/releases/download/${pkgver}/pupdate_linux.zip"
)

sha256sums=('4e90cf6f62cf3fe48b921e9a197e188a1caf0b3fe13e88820d06a7b0f1f28fb9')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/pupdate" "${pkgdir}/usr/bin/pupdate"
}
