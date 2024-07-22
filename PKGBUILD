# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=pupdate-bin
pkgver=3.10.3
pkgrel=1
pkgdesc=" Pupdate, a thing for updating your Analogue Pocket, binary release"
provides=("pupdate")
arch=('x86_64')
url="https://mattpannella.github.io/pupdate"
license=("Apache")

source=(
    "https://github.com/mattpannella/pupdate/releases/download/${pkgver}/pupdate_linux.zip"
)

sha256sums=(
    '171600cf0a85e799274b25cf869ae3b2c5db81b13f5ebdcb27c7ebdcd4d2964c'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/pupdate" "${pkgdir}/usr/bin/pupdate"
}
