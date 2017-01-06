# Maintainer: Katoga <katoga.cz@hotmail.com>
pkgname=apigen
pkgver=4.1.2
pkgrel=1
pkgdesc="Smart and Readable Documentation for your PHP project"
arch=('any')
url="http://www.apigen.org/"
license=('MIT')
depends=('php>=5.5')
source=(
	"https://github.com/ApiGen/ApiGen/releases/download/v${pkgver}/apigen.phar"
	'LICENSE'
)
sha256sums=(
	'9563d5e1692bacb3974e2a8d287b8b89f8ca43cd7cd4ed89aefe30c6cdae7910'
	'2e5a9e806bc0b705f11f500ea57568ab1f4a3d5e63aa4b5bd3ecac3cf03e8fef'
)

package() {
	install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	install -D apigen.phar ${pkgdir}/usr/bin/apigen
}
