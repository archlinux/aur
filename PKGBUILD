# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid="jetbrains-search-provider@swsnr.de"
pkgname=gnome-shell-extension-jetbrains-search-provider
pkgver=10
pkgrel=1
pkgdesc="Add recent projects from JetBrains IDEs to Gnome Shell search"
arch=('any')
url="https://github.com/lunaryorn/jetbrains-search-provider/"
license=('Apache')
depends=('gnome-shell>=3.36' 'python>=3.6')
source=("$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip")
md5sums=('d6bdbd0cb79fe2034a1e8d833362f0c2')
sha1sums=('16849a9c0bab1cecbe79f8c3c4a17d7858117679')
sha512sums=('91a536ed2e3e31f30025c9e1b9a1159dc7d149c849c30f2f3f0d38445c3bd1e455ce2bc4dc3e4e305d70041e29c195294b8b3f0ec015344d601ba2c857512a0c')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js *.py *.ui COPYING
}
