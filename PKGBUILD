# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=3.3.2
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/releases/download/v${pkgver}/files_antivirus.tar.gz")
sha512sums=('d329a403e3b4d27167fc083f8ba80089bec12fbb8a72fa4907a59676bcc82b44d41017bcda47b7d02c0dc15b73d09815cd7686b55443970ae0a334f35ada8f1e')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
