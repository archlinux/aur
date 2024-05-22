#Maintainer: Kimiblock

pkgname=firefox-extension-violentmonkey-bin
url="https://github.com/violentmonkey/violentmonkey"
pkgver=2.19.0
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support."
arch=('any')
license=('MIT')
provides=("firefox-extension-violentmonkey")
conflicts=("firefox-extension-violentmonkey")
source=(
	"ext.xpi"::"https://github.com/violentmonkey/violentmonkey/releases/download/v${pkgver}/Violentmonkey-webext-v${pkgver}.zip"
)

function package(){
	install -Dm644 ext.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{aecec67f-0d10-4fa7-b7c7-609a2db280cf}.xpi"
}

sha256sums=('860268a111673f3967fa2a51a15383b900cb6f4ee84fa6f166ce1133caba39e6')
