# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: wuestengecko

pkgname=keepass-plugin-keetraytotp
_pluginname=KeeTrayTOTP
pkgver=0.108.0
pkgrel=1
pkgdesc="Fork of the Tray TOTP Keepass plugin adding Steam 2FA."
license=('GPL3')
depends=('keepass')
provides=('keepass-plugin-traytotp')
conflicts=('keepass-plugin-traytotp')
arch=('any')
url="https://github.com/victor-rds/KeeTrayTOTP"
source=("${_pluginname}-v${pkgver}.plgx::https://github.com/victor-rds/KeeTrayTOTP/releases/download/v${pkgver}/${_pluginname}.plgx")
sha256sums=('4f7251a9bbb79cad04aee96d1809c6b36d43285a9f3834fef5330fc97ae8bc09')

package() {
  install -Dm644 "${srcdir}/${_pluginname}-v${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
