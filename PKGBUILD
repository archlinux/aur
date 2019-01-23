pkgname=keepass-plugin-traytotp
_pluginname=TrayTotp
pkgver=2.0.0.5
pkgrel=2
pkgdesc="Plugin adding TOTP to KeePass2 tray menu, entry list and auto-type."
license=('GPL3')
depends=('keepass')
arch=('any')
url="http://sourceforge.net/projects/traytotp-kp2/"
source=("http://downloads.sourceforge.net/project/traytotp-kp2/Tray%20TOTP%20v.%20${pkgver}/TrayTotp.plgx")
sha256sums=('6373bb8f91375022c65169c272eb1b262001f0b19e04c459386c65e4ad6263bf')

package() {
  install -Dm644 "${srcdir}/${_pluginname}.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
