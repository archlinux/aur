# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14"
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

sha256sums=('0f9fcbcec9e468de0dfbe20087c8fdb9acc8d4986e15e44c4548fd381feb6c4c')
