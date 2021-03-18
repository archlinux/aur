# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim-web
pkgver='1.7.0'
pkgrel=1
pkgdesc="Jellyfin web client for MPV Shim"
arch=('any')
url='https://github.com/iwalton3/jellyfin-web'
license=('GPL2')
source=("$pkgname-$pkgver.zip::https://github.com/iwalton3/jellyfin-web/releases/download/jwc${pkgver//_/-}/dist.zip")
sha256sums=('a5bdea7da72752eea49ed6df15a6ce9f9fb9cfbe5359097a1ec5bb2543dc220d')

package() {
	mkdir -p "${pkgdir}/usr/lib/jellyfin-mpv-shim"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/lib/jellyfin-mpv-shim/jellyfin-web"
}
