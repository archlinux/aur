# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=5.5.5
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL-3.0-only')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d8f1244f1196fb147f2a5d4be4623eeab6fb2a3b738f8da426f4e9f04fe7c4c8fccbeac8fcdc61ca0f7deb26e2e8496d80021bb6d9cc54228c9c6b32c9dab281')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
