# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.3.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('ed5ca94dcd2ebc6b6d0849b7f32cfe9b')
sha1sums=('9cae3e09f4c1f24ebde75453213cb2822841d2f8')
sha512sums=('31abd7c408d7d9efd35df2a136bdee5396735d5ea72559bb141f9165eb6b8e897693a920af11e84aa65e005623fcc6f34a13583fb1caad3a961ab69b85a17bef')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
