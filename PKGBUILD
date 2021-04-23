# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.1.1
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('53d471bd0a2dd29e4ed1093c7621cff7')
sha1sums=('c22104743bf8c0337e10afa704965b6a3b0e9a07')
sha512sums=('b95bc46877388ebc9703e15e87f7ff52974dd4e49ecf9dcf4a57a54c52e9bd126c0b3cf187b9b89f0b92dc361027c6d12f98178c358b5d7b3b4035d0b17fcce3')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
