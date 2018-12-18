# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: wuestengecko

pkgname=keepass-plugin-keetraytotp
_pluginname=KeeTrayTOTP
pkgver=0.96
pkgrel=1
pkgdesc="Fork of the Tray TOTP Keepass plugin adding Steam 2FA."
license=('GPL3')
depends=('keepass')
provides=('keepass-plugin-traytotp')
conflicts=('keepass-plugin-traytotp')
arch=('any')
url="https://github.com/victor-rds/KeeTrayTOTP"
source=("${_pluginname}-v${pkgver}.plgx::https://github.com/victor-rds/KeeTrayTOTP/releases/download/${pkgver}-Beta/${_pluginname}.plgx")
sha256sums=('96e378a52a695c62aa8c6e813e1e2502af672e03ae1804793007175bc7760de6')

package() {
  install -Dm644 "${srcdir}/${_pluginname}-v${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
