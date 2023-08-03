# Maintainer: iff <iff@ik.me>
pkgname="pay_respects"
pkgver=v0.4.0
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=(any)
url="https://github.com/iffse/pay_respects"
license=('AGPL')
makedepends=()
source=("https://github.com/iffse/pay_respects/releases/download/$pkgver/pay_respects-ubuntu-latest.zip")
sha1sums=('SKIP')

package() {
	install -Dm755 "pay_respects" "$pkgdir/usr/bin/pay_respects"
}

