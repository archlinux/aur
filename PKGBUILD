# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid="jetbrains-search-provider@swsnr.de"
pkgname=gnome-shell-extension-jetbrains-search-provider
pkgver=14
pkgrel=1
pkgdesc="Add recent projects from JetBrains IDEs to Gnome Shell search"
arch=('any')
url="https://github.com/lunaryorn/jetbrains-search-provider/"
license=('Apache')
depends=('gnome-shell>=3.36' 'python>=3.6')
source=("$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip")
md5sums=('32fbf7a7e3b831e26414e856fb169521')
sha1sums=('9503b2c36f8eb777ee94858709e7efe56a796948')
sha512sums=('8fadb7884a6dd5ca650bb85b3820d23c94cd00a8e040c7e8c9f69a3cdd164a4a85cb0741104ca07865d1357cf99c2147ed33ea562cf012d98a93cf5a94efb95f')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js *.py *.ui COPYING
}
