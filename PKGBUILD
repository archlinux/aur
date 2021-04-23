# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.2.3
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('f80617d56fa4e9781c25ce661701ddca')
sha1sums=('8e219c1887112f84b35342d1afe72713a4f59f52')
sha512sums=('4cd26b0b8934eac03539d978d4d22d9dad46714ba8a51cb7bfddeef84418f70ec21bc380281ed970ef053c036a19cc2f115a9f00e93c94ba3e472a109296083c')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
