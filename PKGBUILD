# Maintainer: Kyle <kyle@gmx.ca>
pkgname=chromium-chromevox
pkgver=latest
pkgrel=1
pkgdesc="Causes the Chromium web browser to automatically install and update the ChromeVox screen reader extention. Note: This package does not contain the extension code."
arch=(any)
url="http://www.chromevox.com"
license=('Apache2')
depends=('chromium' 'speech-dispatcher')
options=()
source=(http://the-brannons.com/kgejglhpjiefppelpmljglcjbhoiplfn.json)
md5sums=('60f442d325b1b1838128ba2124183666')
package() {
	cd "$srcdir/"
	#mkdir -p "$pkgdir/usr/lib/chromium/extensions"
	install -D -m 644 kgejglhpjiefppelpmljglcjbhoiplfn.json "$pkgdir/usr/lib/chromium/extensions/kgejglhpjiefppelpmljglcjbhoiplfn.json"
}
