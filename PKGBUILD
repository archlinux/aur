# Maintainer: Josh Klar <j@iv597.com>

pkgname=any-json
pkgver=3.1.0
pkgrel=1
pkgdesc='Convert (almost) anything to JSON'
arch=(any)
url='https://github.com/laktak/any-json'
license=('MIT')
depends=('nodejs')
makedepends=('npm')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr \
		--cache "${srcdir}/npm-cache" \
		"${pkgname}@${pkgver}"

	install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
