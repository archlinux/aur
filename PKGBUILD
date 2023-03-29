# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=4.0.3
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2b632553575ecca509f67f73e3d78484e5de89d4a14daeed04c5469604837a57363c720ac1583a1d6d60533d185be333fae63f61463c6fb9e03393e98324be06')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
