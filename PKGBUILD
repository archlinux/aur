# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.1.1
pkgrel=2
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('492a84b53d586ddcdf12c55ceacaaae6')
sha1sums=('bf64d4c2e57335e9f39d17849121d7232f84d065')
sha512sums=('919f618930cc35fcfe152d2a635cab40a48fa518ce5a72620f5f78e6b2046074db3558ec543dc52ec8f8c78b87908c778a062e44ec4dee3186d87a375caadb15')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
