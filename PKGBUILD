# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=keepass-plugin-keetraytotp
_pluginname=KeeTrayTOTP
pkgver=0.9
pkgrel=1
pkgdesc="Fork of the Tray TOTP Keepass plugin adding Steam 2FA."
license=('GPL3')
depends=('keepass')
provides=('keepass-plugin-traytotp')
conflicts=('keepass-plugin-traytotp')
arch=('any')
url="https://github.com/victor-rds/KeeTrayTOTP"
source=("https://github.com/victor-rds/KeeTrayTOTP/releases/download/0.9-Beta/KeeTrayTOTP.plgx")
sha256sums=('d4f46a850fb8f8736191184725e6b3275647deb830bba82cc6649503b0fe2ce3')

package() {
  install -Dm644 "${srcdir}/${_pluginname}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
