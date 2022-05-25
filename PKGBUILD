# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-files-antivirus
pkgver=3.3.0
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/files_antivirus"
license=('AGPL3')
depends=('nextcloud' 'clamav')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/files_antivirus/releases/download/v${pkgver}/files_antivirus.tar.gz")
sha512sums=('da504142ab2ef2342bd9ff187da274162e68e0d63bc8a78ec1a2dfcaa0a57400257fa5722175b3e331391735d1d9a81d5d3fd27044bc6b1df47b7ba31deec894')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/files_antivirus" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_antivirus"
}
