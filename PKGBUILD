# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_uuid="jetbrains-search-provider@swsnr.de"
pkgname=gnome-shell-extension-jetbrains-search-provider
pkgver=1
pkgrel=1
pkgdesc="Add recent projects from JetBrains IDEs to Gnome Shell search"
arch=('any')
url="https://github.com/lunaryorn/jetbrains-search-provider/"
license=('Apache')
depends=('gnome-shell>=3.36' 'python>=3.6')
source=("$url/releases/download/v$pkgver/${_uuid}.shell-extension.zip")
md5sums=('bb2f40d30565fb413d75762b9dbe307d')
sha1sums=('94a1fff87039b03d98f2982c20a19eaf5849fb67')
sha512sums=('e050b5664767f0ec6056c438ca3784ed79d43e24bcb4aab8051c775b22a997f4af54852bbbac1c472e7af064146639cc13f70660dd44804cb4e4a17af0a7c242')

package() {
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" -- metadata.json *.js *.py
}
