# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid="jetbrains-search-provider@swsnr.de"
pkgname=gnome-shell-extension-jetbrains-search-provider
pkgver=11
pkgrel=1
pkgdesc="Add recent projects from JetBrains IDEs to Gnome Shell search"
arch=('any')
url="https://github.com/lunaryorn/jetbrains-search-provider/"
license=('Apache')
depends=('gnome-shell>=3.36' 'python>=3.6')
source=("$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip")
md5sums=('c8f7b3ca4990ad2e83060cdd3561ec6d')
sha1sums=('bf5f6d9e2f2db86c60e341368cbf97f83a6beb17')
sha512sums=('9efd74cf64786eddae310b1b63de50604d5812c86d498d1c29bc9d3826bf992bbc1f0c643ecc03b30595afe23a5c845fa824dcabcf7fafe6d6e870c8d954849b')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js *.py *.ui COPYING
}
