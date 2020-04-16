# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: wuestengecko

pkgname=keepass-plugin-keetraytotp
_pluginname=KeeTrayTOTP
pkgver=0.105.0
pkgrel=1
pkgdesc="Fork of the Tray TOTP Keepass plugin adding Steam 2FA."
license=('GPL3')
depends=('keepass')
provides=('keepass-plugin-traytotp')
conflicts=('keepass-plugin-traytotp')
arch=('any')
url="https://github.com/victor-rds/KeeTrayTOTP"
source=("${_pluginname}-v${pkgver}.plgx::https://github.com/victor-rds/KeeTrayTOTP/releases/download/v${pkgver}/${_pluginname}.plgx")
sha256sums=('5a47eaf2e7a99c4818fce0921c0024b6e81da6d10c435d6a3da3774c25722052')

package() {
  install -Dm644 "${srcdir}/${_pluginname}-v${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
