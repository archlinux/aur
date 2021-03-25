# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim-web
pkgver='1.7.0_4'
pkgrel=1
pkgdesc="Jellyfin web client for MPV Shim"
arch=('any')
url='https://github.com/iwalton3/jellyfin-web'
license=('GPL2')
source=("$pkgname-$pkgver.zip::https://github.com/iwalton3/jellyfin-web/releases/download/v${pkgver//_/-}/dist.zip")
sha256sums=('777f1281f85a109086806d1b9888d5dd70e0b5a311f1fe30e8b9e52de3cadab9')

package() {
	mkdir -p "${pkgdir}/usr/lib/jellyfin-mpv-shim"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/lib/jellyfin-mpv-shim/jellyfin-web"
}
