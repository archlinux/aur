# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Duplicate files finder for Nextcloud servers'
pkgname=('nextcloud-app-duplicatefinder')
pkgver='0.0.5'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="PaulLereverend/NextcloudDuplicateFinder"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("duplicate-finder-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/duplicatefinder.tar.gz")
sha512sums=('b2b61ebbaaff252c6e8cf9246281df797359b4b7f6443eee59de3ad5dc3f41cf66ccaf5598c3e71e31e8f09cdd933ad52bfb1d31ff4e48bf16872f6b4f49a087')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/duplicatefinder" "${pkgdir}/usr/share/webapps/nextcloud/apps/duplicatefinder"
}
