# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=jabba-bin
_pkgname=jabba
pkgver=0.12.2
pkgrel=2
pkgdesc="(cross-platform) Java Version Manager"
arch=('x86_64')
url="https://github.com/Jabba-Team/jabba"
license=('Apache')
depends=()
provides=('java-environment' 'jabba')
conflicts=('jabba')
source=("https://github.com/Jabba-Team/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('94962dd0352e0373c76ec94fbec3d788ab4e05472e6dd6c29b5868403a939bbb')

package() {
	cd "$srcdir"
	install -Dm0755 "$_pkgname-$pkgver-linux-arm64" "$pkgdir/usr/bin/jabba"
}
