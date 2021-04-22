# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.1.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('045c79ebfdba149fb287d5ebda17559c')
sha1sums=('2b432f90ac6ffa85b14652638c4185abcf91675c')
sha512sums=('546e4b96ba276702e18d318d8af9c4ae5a815eee55764c6a34b055a21cf411fc846ddf9b9a9563d4919059928a6f5e8eb57c708e259d6bd4a7583aae513d3489')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" build install
}
