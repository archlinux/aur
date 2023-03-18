# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Custom CSS support for Nextcloud servers'
pkgname=('nextcloud-app-theming-customcss')
pkgver=1.13.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/theming_customcss"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("theming_customcss-${pkgver}.tar.gz::https://github.com/juliushaertl/theming_customcss/releases/download/v${pkgver}/theming_customcss.tar.gz")


package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/theming_customcss" "${pkgdir}/usr/share/webapps/nextcloud/apps/theming_customcss"
}
sha256sums=('36fe378e912ca18024aa5155ab4d1b3ec1648270e2916639ea484f640f25edcf')
