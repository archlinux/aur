# Maintainer: Arvedui <arvedui@posteo.de
pkgname=tt-rss-plugin-tumblr-gdpr
pkgver=2.1
pkgrel=1
pkgdesc="Plugin for Tiny Tiny RSS to workaround GDPR in Europe"
arch=('any')
url="https://github.com/GregThib/ttrss-tumblr-gdpr"
license=('GPL3')
depends=('tt-rss')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('5a51749bb785370ce067a31d049fb33e')

package() {
	installdir="${pkgdir}/usr/share/webapps/tt-rss/plugins/tumblr_gdpr/"
	cd "ttrss-tumblr-gdpr-$pkgver"

	install -m 755 -d "${installdir}"
	install -D -m 644 init.php "${installdir}"
}
