# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Custom CSS support for Nextcloud servers'
pkgname=('nextcloud-app-theming-customcss')
pkgver=1.7.0
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
sha256sums=('c23132a9b5ba39aa4d811adbcb4b1309ff036bcc6a3ae12b2de056bcc7ae23ec')
