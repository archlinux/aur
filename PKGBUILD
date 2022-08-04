# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=3.3.1
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/releases/download/v${pkgver}/files_antivirus.tar.gz")
sha512sums=('f52c41e62cb8846bddb343004da6d6a7486a43d3882fefcbca93032b8c7122668db6db2d73f89ab4d8687441993454fa98130fca19067275b00f1abc39a2b3a5')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
