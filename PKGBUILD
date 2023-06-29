# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=5.2.0
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d650c0d6d8281227df415dc1a6bafa6c5a6f8c377e96b22e7dbb88622faa49fa4b770da291c649f50e981718d2a84f84fea4936f385806ed0ebe49ee6b115ce6')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
