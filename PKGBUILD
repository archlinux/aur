# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim-web
pkgver='1.7.0_5'
pkgrel=1
pkgdesc="Jellyfin web client for MPV Shim"
arch=('any')
url='https://github.com/iwalton3/jellyfin-web'
license=('GPL2')
source=("$pkgname-$pkgver.zip::https://github.com/iwalton3/jellyfin-web/releases/download/v${pkgver//_/-}/dist.zip")
sha256sums=('6c01a39d46b68664f9f4e1a82d9c75623d99dcb03b78e1bb5ad42ec485195bfa')

package() {
	mkdir -p "${pkgdir}/usr/lib/jellyfin-mpv-shim"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/lib/jellyfin-mpv-shim/jellyfin-web"
}
