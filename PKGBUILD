# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Integrated Epub.js for Nextcloud servers.'
pkgname=('nextcloud-app-files-ebookreader')
pkgver=0.0.1
pkgrel=1
arch=('any')
license=('AGPL')
url="https://git.project-insanity.org/onny/web-nextcloud-app-files_ebookreader"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_ebookreader.tar.gz::https://onny.project-insanity.org/files/files_ebookreader-${pkgver}.tar.gz")

sha512sums=('f01f5eeff972a033f96a2fa6f7114d2d696c12bcda6f168b9066268c54a7f112b24e971b661ae5ef8db3e2943c546e601387ac3f024f2c8f2bc512e31bf0fb74')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/files_ebookreader" "${pkgdir}/usr/share/webapps/nextcloud/apps/files_ebookreader"
}

