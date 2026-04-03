# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=jabba-bin
_pkgname=jabba
pkgver=0.15.0
pkgrel=1
pkgdesc="(cross-platform) Java Version Manager"
arch=('x86_64')
url="https://github.com/Jabba-Team/jabba"
license=('Apache-2.0')
provides=('java-environment' 'jabba')
conflicts=('jabba')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('86308126742eddeb7cca901212c9de56383944bc79fc44e0492c3fa85f5cdd62')

package() {
	cd "$srcdir"
	install -Dm0755 "$_pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/jabba"
}
