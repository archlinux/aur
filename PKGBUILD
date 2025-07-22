# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=javcap-bin
pkgver=0.2.16
pkgrel=1
pkgdesc="电影刮削器"
url="https://github.com/jane-212/javcap"
provides=("${pkgname%-bin}")
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('71a7bee8c3cadc8c33b0269c90d6d8be0b782a187ae8c1ef7c12633ac26c0452')
sha256sums_aarch64=('f6d2a827c7e8e8048de0ee396b9115c13ea2a9fe0671195d0869eb048fcce360')

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
