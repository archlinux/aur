# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.1"
pkgrel=1
pkgdesc="Batch git repository analysis tool"
arch=('x86_64')
url="https://github.com/7aske/rgs"
conflicts=('rgs')
license=('GPL2')
depends=('libgit2')
makedepends=('cargo')
source=($url/releases/download/$pkgver/rgs-$pkgver-linux-x86_64)

package() {
	install -Dm 755 rgs-${pkgver}-linux-x86_64 -T ${pkgdir}/usr/bin/rgs
}

sha256sums=('4e5d2496e3002549c74521fa966ebd93e5e4d4bbea952c491f21c83c2c61ffad')
