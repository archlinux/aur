# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Duplicate files finder for Nextcloud servers'
pkgname=('nextcloud-app-duplicatefinder')
pkgver='0.0.6'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="PaulLereverend/NextcloudDuplicateFinder"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("duplicate-finder-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/duplicatefinder.tar.gz")
sha512sums=('d3e95471650af7e50d74b09f3a636dce24d73a845e21760ebd61975b3362a153a94bfd32c36a8f438c2cdaef4527fd98061447a456b3beca7976ccf4c704e8f9')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/duplicatefinder" "${pkgdir}/usr/share/webapps/nextcloud/apps/duplicatefinder"
}
