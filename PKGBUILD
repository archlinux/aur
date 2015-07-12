# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>

_pkgname=keeotp
_pkgname2=KeeOtp
pkgname=keepass-plugin-keeotp
pkgver=1.3.6
pkgrel=1
pkgdesc="KeePass plugin that generates TOTPs from secrets stored in the KeePass database (ie: Google Authenticator, other RFC 6238 compliant TOTP implementations)"
license=('MIT')
depends=('keepass')
provides=('keepass-plugin-keeotp')
conflicts=('keepass-plugin-keeotp-beta')
arch=('any')
url="https://bitbucket.org/devinmartin/keeotp/wiki/Home"
source=("https://bitbucket.org/devinmartin/keeotp/downloads/${_pkgname2}-${pkgver}.zip")
sha512sums=('5110b258d56f875f342914c5bf27cbd5107461e5a0eb6f84a9736a1e4b56ca35c0434997ac239cc01990cdb2d363eae1f5dc8de34a02f35980004090af00ef0e')


package() {
    install -Dm644 "${srcdir}"/${_pkgname2}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}.plgx
    install -Dm644 "${srcdir}"/README.txt "${pkgdir}"/usr/share/keepass/plugins/${_pkgname2}-README.txt
    install -Dm644 "${srcdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
