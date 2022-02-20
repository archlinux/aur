# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs-bin"
pkgver="1.13"
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

sha256sums=('b47e4b66465930bc5f6f31db0adcf1754639c30aaa0f4bb6a4fa38108c9b8263')
