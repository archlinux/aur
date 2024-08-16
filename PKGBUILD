# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=jabba-bin
_pkgname=jabba
pkgver=0.13.0
pkgrel=3
pkgdesc="(cross-platform) Java Version Manager"
arch=('x86_64')
url="https://github.com/Jabba-Team/jabba"
license=('Apache-2.0')
depends=('glibc')
provides=('java-environment' 'jabba')
conflicts=('jabba')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64")
sha256sums=('79a065f9fef7e3108c836deb01b01ffccc56bb7ace691584c7fbff9b9a67796b')

package() {
	cd "$srcdir"
	install -Dm0755 "$_pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/jabba"
}
