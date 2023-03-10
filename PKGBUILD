# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=jabba-bin
_pkgname=jabba
pkgver=0.12.2
pkgrel=1
pkgdesc="(cross-platform) Java Version Manager"
arch=('x86_64')
url="https://github.com/Jabba-Team/jabba"
license=('Apache')
depends=()
provides=('java-environment' 'jabba')
conflicts=('jabba')
source=("https://github.com/Jabba-Team/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('e0d490c98a5252e12a20560c39b8320cf567f4c980ee80f127f2dd02ecbb01e1')

package() {
	cd "$srcdir"
	install -Dm0755 "$_pkgname-$pkgver-linux-arm64" "$pkgdir/usr/bin/jabba"
}
