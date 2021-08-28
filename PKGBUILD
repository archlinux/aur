# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.6.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('64ac11bad9c14256dc596699c353e121')
sha1sums=('457a1f781a7dbd5677e39e8aaca97a0f609e9cba')
sha512sums=('e05e86be7cdcec0dc7833e15d2a4fbfbfcd604b6e6bec0783b07b3167031bc7c0f604e86079e21b8a3867c815da752f237bee255197467ebd6a368e611e921ab')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
