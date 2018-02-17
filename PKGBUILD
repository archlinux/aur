# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Allows to create a website as a subfolder of the cloud.'
pkgname=('nextcloud-app-picocms')
pkgver=0.9.7
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/nextcloud/cms_pico"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("cms_pico-${pkgver}.tar.gz::https://github.com/nextcloud/cms_pico/releases/download/v${pkgver}/cms_pico-${pkgver}.tar.gz")
sha256sums=('041c87abb1932f25aaae65b998e873bd343213c0160ff873c91f24b70389e9cf')


package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/cms_pico" "${pkgdir}/usr/share/webapps/nextcloud/apps/cms_pico"
}

