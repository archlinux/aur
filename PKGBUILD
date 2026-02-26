# Maintainer: Everything2067 <anand shaurya at proton dot me>
pkgname=librewolf-extension-plasma-integration-bin
pkgver=2.1
pkgrel=1
pkgdesc="Plasma Integration extension for LibreWolf"
arch=(any)
url="https://addons.mozilla.org/en-US/firefox/addon/plasma-integration"
license=('GPL-3.0-only')
groups=(librewolf-addons)
depends=(librewolf)
provides=(librewolf-extension-plasma-integration)
conflicts=(librewolf-extension-plasma-integration)
_filename=plasma-browser-integration@kde.org.xpi
source=("$_filename-$pkgver::https://addons.mozilla.org/firefox/downloads/file/4614817/plasma_integration-2.1.xpi")
noextract=("$_filename-$pkgver")
sha256sums=(35bfa3766e097160e74f525bde54d97bbba90d725daa425b9de6fef6ec5e9d44)

package() {
	install -Dm 644 "$_filename-$pkgver" "$pkgdir/usr/lib/librewolf/browser/extensions/$_filename"
}
