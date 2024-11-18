# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.5.6
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
optdepends=(
	'which: for rules checking executable availability'
)
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-ubuntu-latest.zip")
sha1sums=('082ad98344e8fa8cf9f9ce05366e978a5d2ceae5')
replaces=("pay_respects-bin")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
}
