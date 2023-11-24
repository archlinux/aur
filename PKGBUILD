# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=5.4.0
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2e6ce472f0125483b773c950a25dd62ed24e60b0621dc183f5fdabb5ad055b05a35c8abe9f0820708c712c95427104cee0d005d592fa00d96e11346a5544fa97')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
