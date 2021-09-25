# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.5.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('621165500902da4b10f2bbfdd4b26522')
sha1sums=('d42699e9b6c1d0aa7ba604233b6cb54cf50b1cac')
sha512sums=('93ebb0bdb6b303cb152a9a31469b7c6da179188e9553b901d4893f701272781df022dc81d6ae14fc5c4871aac7859abb93856d04fcfdfae565a16eaf1d27d211')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
