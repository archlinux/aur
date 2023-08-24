# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.4"
pkgrel=1
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

sha256sums=('2952bc2f17854c73dc109af6a58ca266a8ea85a3dcfad02fa2fb4110afd4e861')
