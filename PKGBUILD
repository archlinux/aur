# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=wps-office-all-dicts-win-languages
pkgver=11.2.0.9255
pkgrel=2
pkgdesc="All Spelling Languages of Windows Version WPS Office Multilingual User Interface (MUI) for use on Linux"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/blob/master/Build/${pkgver}/dicts-all-in-one/dicts.7z?raw=true)
sha512sums=('d0aabf96b83dd5018d9d01b65ad701b50566faf85d2b3dd71e7b0b57d7ac71ec903b8dc6b779409cb895fc04dbb8e408ebaa0a28e1fc5b97072eef67885ea86a')

package() {
	cd "$srcdir/dicts"
	install -d "$pkgdir"/usr/lib/office6/dicts/spellcheck/
	cp -R * "$pkgdir"/usr/lib/office6/dicts/spellcheck/
	rm -R "$pkgdir"/usr/lib/office6/dicts/spellcheck/en_US
}

