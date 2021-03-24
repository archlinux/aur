# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=3.2.0
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/releases/download/v${pkgver}/files_antivirus.tar.gz")
sha512sums=('a8c5326928956fec6daa18689b588612970237686169c56ba159df53e63910ae146c00550ed7eab88d805aa71b786fcc34f1417833eba097e2258409c61cea1e')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
