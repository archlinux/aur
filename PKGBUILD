# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=javcap-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="电影刮削器"
url="https://github.com/jane-212/javcap"
provides=("${pkgname%-bin}")
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b413ca2b13bd3b2df3df319d7a8ca962d034254a4c8dfdb1651e3c5ec5a3ae12')
sha256sums_aarch64=('c33db918d132dd745f235a65d2c88d44f707ca09e2a3f5262976f612dbe1672d')

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
