# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.14.3"
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

sha256sums=('7dfa4ce9c91553abfae2b83f73bd92fc6a4271b47d93cea08e00e7a8956540cb')
