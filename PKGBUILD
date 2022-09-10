# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=nextcloud-app-carnet
pkgver=0.24.5
pkgrel=1
pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
arch=('any')
license=('AGPL')
url="https://github.com/PhieF/CarnetNextcloud"
depends=('nextcloud')
options=('!strip')
source=("carnet-nc-${pkgver}.tar.gz::https://github.com/CarnetApp/CarnetNextcloud/releases/download/v${pkgver}/carnet-nc-v${pkgver}.tar.gz")
sha256sums=('1a6a0524229ac19e5ce46e991fb72a8884151a7b00f244c08ea59dde0947942e')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/carnet" "${pkgdir}/usr/share/webapps/nextcloud/apps/carnet"
}

