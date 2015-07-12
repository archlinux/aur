# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>

_pkgname=keeotp
_pkgname2=KeeOtp
pkgname=keepass-plugin-keeotp-beta
pkgver=1.3.7
pkgrel=1
pkgdesc="KeePass plugin that generates TOTPs from secrets stored in the KeePass database (ie: Google Authenticator, other RFC 6238 compliant TOTP implementations) (Beta version)"
license=('MIT')
depends=('keepass')
provides=('keepass-plugin-keeotp')
conflicts=('keepass-plugin-keeotp')
arch=('any')
url="https://bitbucket.org/devinmartin/keeotp/wiki/Home"
source=("https://bitbucket.org/devinmartin/keeotp/downloads/${_pkgname2}-${pkgver}-Beta.zip")
sha512sums=('08d84aefb397b2795698317ae7f6fddd006e40cf78a155955f2dc184bef765469671ca7df385f409c85e862803e6b80ce6cb899cdbf5730334c08f4e83bd2a63')


package() {
    install -Dm644 "${srcdir}"/${_pkgname2}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}.plgx
    install -Dm644 "${srcdir}"/README.txt "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}-README.txt
    install -Dm644 "${srcdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
