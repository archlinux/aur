# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.4.1
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPLv2)
url=https://github.com/ianbrunelli/gnome-shell-extension-installer
depends=(bash curl glib2 gnome-shell)
optdepends=("less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(2a87a710dc2a98a91a069d0bb1cdb4526a101e260c4a152e43de5dff0b0a3ec3)

package() {
	mkdir -p "$pkgdir/usr/bin"
	install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
