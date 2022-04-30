# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Custom CSS support for Nextcloud servers'
pkgname=('nextcloud-app-theming-customcss')
pkgver=1.11.0
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
sha256sums=('6fc4fdae4552be5725e931ab962416775d57879c6d33fb7db23df7e6d46a6855')
