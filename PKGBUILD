# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.5"
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

sha256sums=('ccf3c12eece69de41d7c476488a7ac3f235b8cfa60ab46d544bc9fd90de12e24')
