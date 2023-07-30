# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.3"
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

sha256sums=('aa8fd4691e7d22c3cf66a7f5c7a79ebf6d4245bbc7a91da0d2f14e6ab099a9a5')
