# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: wuestengecko

pkgname=keepass-plugin-keetraytotp
_pluginname=KeeTrayTOTP
pkgver=0.94
pkgrel=2
pkgdesc="Fork of the Tray TOTP Keepass plugin adding Steam 2FA."
license=('GPL3')
depends=('keepass')
provides=('keepass-plugin-traytotp')
conflicts=('keepass-plugin-traytotp')
arch=('any')
url="https://github.com/victor-rds/KeeTrayTOTP"
source=("${_pluginname}-v${pkgver}.plgx::https://github.com/victor-rds/KeeTrayTOTP/releases/download/${pkgver}-Beta/${_pluginname}.plgx")
sha256sums=('92154e2a3ed42d31ff784204387653495f6029b46c6361528534579e95241379')

package() {
  install -Dm644 "${srcdir}/${_pluginname}-v${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
