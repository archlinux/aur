# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.5"
pkgrel=2
pkgdesc="Batch git repository analysis tool"
arch=('x86_64')
url="https://github.com/7aske/rgs"
conflicts=('rgs')
license=('GPL2')
depends=('libgit2')
makedepends=()
source=($url/releases/download/$pkgver/rgs-$pkgver-linux-$CARCH)

package() {
	install -Dm 755 rgs-${pkgver}-linux-$CARCH -T ${pkgdir}/usr/bin/rgs
	install -Dm 755 rgs-${pkgver}-linux-$CARCH -T ${pkgdir}/usr/bin/cgs
}

sha256sums=('cece997f8f30ff3f8a8ceb604f3993a266a676734490893e29a61925d85a9bf3')
