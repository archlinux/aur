# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim-web
pkgver='1.6.2'
pkgrel=1
pkgdesc="Jellyfin web client for MPV Shim"
arch=('any')
url='https://github.com/iwalton3/jellyfin-web'
license=('GPL2')
source=("$pkgname-$pkgver.zip::https://github.com/iwalton3/jellyfin-web/releases/download/jwc$pkgver/dist.zip")
sha256sums=('10f1ec0b05fd75006c43dbd9760fa58aa116aadf737b37fcef58e59af08cb2b4')

package() {
	mkdir -p "${pkgdir}/usr/lib/jellyfin-mpv-shim"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/lib/jellyfin-mpv-shim/jellyfin-web"
}
