# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Custom CSS support for Nextcloud servers'
pkgname=('nextcloud-app-theming-customcss')
pkgver=1.4.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/theming_customcss"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("theming_customcss-${pkgver}::https://github.com/juliushaertl/theming_customcss/releases/download/v${pkgver}/theming_customcss.tar.gz")


package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/theming_customcss" "${pkgdir}/usr/share/webapps/nextcloud/apps/theming_customcss"
}


md5sums=('1ec9df991fe5274349cf9769cb5cf469')
