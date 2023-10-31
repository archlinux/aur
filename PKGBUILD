# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=wps-office-all-dicts-win-languages
pkgver=11.1.0.11704
pkgrel=0
pkgdesc="All Spelling Languages of Windows Version WPS Office Multilingual User Interface (MUI) for use on Linux"
arch=(any)
url="https://github.com/wachin/wps-office-all-mui-win-language"
license=(GPL3)
depends=(wps-office)
conflicts=()
source=(https://github.com/wachin/wps-office-all-mui-win-language/releases/download/v${pkgver}/dicts.7z)
sha256sums=('c459d0b37eab1c603ca3b699534f3ead705e4e943c4e37780cfd7754d5e94a17')

package() {
	cd "$srcdir/dicts"
	install -d "$pkgdir"/usr/lib/office6/dicts/spellcheck/
	cp -R * "$pkgdir"/usr/lib/office6/dicts/spellcheck/
	rm -R "$pkgdir"/usr/lib/office6/dicts/spellcheck/en_US
}

