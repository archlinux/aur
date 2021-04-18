# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=skydroid-cli
pkgname=$_pkgname-bin
pkgver=0.1.3
pkgrel=2
pkgdesc="Command-line tool for SkyDroid app distribution."
arch=('x86_64')
url="https://github.com/redsolver/skydroid-cli"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
options=('!strip')
source=("$pkgname-$pkgver::https://github.com/redsolver/skydroid-cli/releases/download/v$pkgver/skydroid-linux"
        "LICENSE::https://raw.githubusercontent.com/redsolver/skydroid-cli/v$pkgver/LICENSE")

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('8c67b6400661f68f6a4c59e07274d38a'
         '30080721783761a00d969921828b4494')
