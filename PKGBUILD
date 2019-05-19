# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Custom CSS support for Nextcloud servers'
pkgname=('nextcloud-app-theming-customcss')
pkgver=1.3.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/theming_customcss"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("theming_customcss-${pkgver}::https://github.com/juliushaertl/theming_customcss/releases/download/v${pkgver}/theming_customcss.tar.gz")

sha256sums=('c24a1e6bfa8c23eb6454e6305333b2511dc26617d17d097117eb1f220e4f3109')
md5sums=('e65e5f39f696bd0df290011ceafcc7c8')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/theming_customcss" "${pkgdir}/usr/share/webapps/nextcloud/apps/theming_customcss"
}

