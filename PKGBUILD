# Maintainer: iff <iff@ik.me>
pkgname="pay_respects-bin"
pkgver=0.4.3
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay_respects"
license=('AGPL')
makedepends=()
provides=('pay_respects')
conflicts=('pay_respects')
source=("https://github.com/iffse/pay_respects/releases/download/v$pkgver/pay_respects-ubuntu-latest.zip")
sha1sums=('bbdab6d2ab54a018bf4732093c796faa9a06eab9')

package() {
	install -Dm755 "pay_respects" "$pkgdir/usr/bin/pay_respects"
}

