# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-notes
_app=notes
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple Notes app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/notes"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/${_app}/releases/download/v${pkgver}/${_app}.tar.gz")
sha512sums=('c4329123623aa1018237376eec46b6bb4f2705554df8a4b7d4109591749db952dd4c21b6a612df1a7f26e32cd0668331569196782229c0d7fcb0af714d41c482')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/${_app}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_app}"
}
