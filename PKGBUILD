# Maintainer : Eragon <eragon at eragon dot re>
# Contributor : vpzomtrrfrt

pkgrel=1
pkgver=0.4.4
pkgname=yggdrasil-openrc
depends=("yggdrasil")
arch=("any")
source=("https://raw.githubusercontent.com/yggdrasil-network/yggdrasil-go/v${pkgver}/contrib/openrc/yggdrasil")
sha256sums=("3f83382204f1c0cc807a0873c3d4f024445965a552da251ca48d87744dec07cd")

package() {
	install -t "$pkgdir"/etc/init.d -Dm755 "$srcdir"/yggdrasil
}
