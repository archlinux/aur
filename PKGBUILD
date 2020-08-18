# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim-web
pkgver='1.6.2_1'
pkgrel=1
pkgdesc="Jellyfin web client for MPV Shim"
arch=('any')
url='https://github.com/iwalton3/jellyfin-web'
license=('GPL2')
source=("$pkgname-$pkgver.zip::https://github.com/iwalton3/jellyfin-web/releases/download/jwc${pkgver//_/-}/dist.zip")
sha256sums=('56b46d47623a9904f61337d3dcf63f8aabeb442e93e0c12fe19a0264f0f3e50e')

package() {
	mkdir -p "${pkgdir}/usr/lib/jellyfin-mpv-shim"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/lib/jellyfin-mpv-shim/jellyfin-web"
}
