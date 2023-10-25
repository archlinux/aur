# Maintainer: Rajala1404 <rajalagamer3.0@gmail.com>
pkgname="folia-server-builder"
pkgver=1.0.2
pkgrel=1
pkgdesc="Easily create your own Folia server"
arch=("any")
url="https://github.com/Rajala1404/folia-server-builder"
license=('GPL-3.0')
depends=("git" "bash" "sh" "jdk17-openjdk")
source=("https://github.com/Rajala1404/folia-server-builder/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	mv $pkgname.sh $pkgname
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
