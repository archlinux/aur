# Maintainer: Emilio Aburto <eaburto@dcc.uchile.cl>

_pkgname=keeotp
_pkgname2=KeeOtp
pkgname=keepass-plugin-keeotp
pkgver=1.3.9
pkgrel=1
pkgdesc="KeePass plugin that generates TOTPs from secrets stored in the KeePass database (ie: Google Authenticator, other RFC 6238 compliant TOTP implementations)"
license=('MIT')
depends=('keepass')
provides=('keepass-plugin-keeotp')
conflicts=('keepass-plugin-keeotp-beta')
arch=('any')
url="https://bitbucket.org/devinmartin/keeotp/wiki/Home"
source=("https://bitbucket.org/devinmartin/keeotp/downloads/${_pkgname2}-${pkgver}.zip")
sha512sums=('51d9101d92a11b17a6b048a7c37feddeeb148141878ab5831dca532418a1050a2867a31c992a3fcfdf4c58a5e470f021f27ad7069c787478f9bfb54f0f72bf03')


package() {
    install -Dm644 "${srcdir}"/${_pkgname2}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}.plgx
    install -Dm644 "${srcdir}"/README.txt "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}-README.txt
    install -Dm644 "${srcdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
