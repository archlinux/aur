# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=3.2.2
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/releases/download/v${pkgver}/files_antivirus.tar.gz")
sha512sums=('bb240edcefc95e56a21dae7e5d8ac817a57dda52cd9a559a77d75876857a664ab493b8116fc5696c5947a2c8212b86e4f84d2c9c36ad216d50cdc2986febb33e')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
