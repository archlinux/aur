# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=javcap-bin
pkgver=0.2.15
pkgrel=1
pkgdesc="电影刮削器"
url="https://github.com/jane-212/javcap"
provides=("${pkgname%-bin}")
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8d08554f46b5c53466ca8d63c1c6e2582f1797b97763e7ead1d6f01f419cddb2')
sha256sums_aarch64=('7304f812124fd884aa5f9797bfe844600f04abff9642b1ad90d12cc8c55c8afb')

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
