# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=5.1.1
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cb47aa432c1a21e9b30ff75145aaa683bfdc722ef7f8da58a3dc7df15adc31f7d621e4dc1c3323a3fffe167ec282bdebbc2d02cd7c3d4a491787a7c75a4d92bd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
