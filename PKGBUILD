# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.12"
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

sha256sums=('2a969a21ed8e0724c77b092c66d959219e54d5c1c2ec6373aa7eac227f11896c')
