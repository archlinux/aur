# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid="intellij-idea-search-provider@swsnr.de"
pkgname=gnome-shell-extension-intellij-idea-search-provider
pkgver=5
pkgrel=1
pkgdesc="Add recent IntelliJ IDEA projects to Gnome Shell search"
arch=('any')
url="https://github.com/lunaryorn/gnome-intellij-idea-search-provider/"
license=('Apache')
depends=('gnome-shell>=3.36' 'python>=3.6')
source=("$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip")
md5sums=('be7cb089b3ef41a93933b3cf12271802')
sha1sums=('36b744c0cd802eb181589d0ea4a8e6ece08b8925')
sha512sums=('20665b64cc4ec572a4879f78e341d7db3842e106ef8ba42fc78fb91770d740f8aab33979c452a0e7725fb5798b3b14d25eebeb9f1b7a96394a01f026d5dc6ea1')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js *.py
}
