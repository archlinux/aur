# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Duplicate files finder for Nextcloud servers'
pkgname=('nextcloud-app-duplicatefinder')
pkgver=0.0.4
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/PaulLereverend/NextcloudDuplicateFinder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("duplicate-finder-${pkgver}.tar.gz::https://github.com/PaulLereverend/NextcloudDuplicateFinder/releases/download/${pkgver}/duplicatefinder.tar.gz")
sha512sums=('63f7836ec55b9fe65541ff4929632de526778223330c695a35a34303110fc3b09f32eaa777293e4c1b6d9848af66fa2ddd1c5e6c25e8e85eb6d2d9fe01109a0b')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/duplicatefinder" "${pkgdir}/usr/share/webapps/nextcloud/apps/duplicatefinder"
}
