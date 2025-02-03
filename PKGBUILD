#Maintainer: Kimiblock

pkgname=firefox-extension-violentmonkey-bin
url="https://github.com/violentmonkey/violentmonkey"
pkgver=2.30.0
pkgrel=1
makedepends=()
pkgdesc="Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support."
arch=('any')
license=('MIT')
provides=("firefox-extension-violentmonkey")
conflicts=("firefox-extension-violentmonkey")
source=(
	"ext-${pkgver}.xpi"::"https://github.com/violentmonkey/violentmonkey/releases/download/v${pkgver}/Violentmonkey-webext-v${pkgver}.zip"
)

function package(){
	install -Dm644 "ext-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{aecec67f-0d10-4fa7-b7c7-609a2db280cf}.xpi"
}

sha256sums=('be06cb686138902e9ae4a66bea3a405efb4979f6a8dd9e2eb4af32ede501ee9e')
