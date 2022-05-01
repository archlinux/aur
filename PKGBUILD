# Maintainer: Redson <redson@riseup.net>
pkgname='ppfetch-rs-bin'
_pkgname='ppfetch-rs'
pkgver=2.0.0
pkgrel=1
pkgdesc="ppfetch, but written in Rust. GitHub release binary"
arch=('x86_64')
url="https://github.com/RedsonBr140/ppfetch-rs"
license=('MIT')
depends=('wmctrl')
source=("https://github.com/RedsonBr140/${_pkgname}/releases/download/v${pkgver}/${_pkgname}"
	"https://raw.githubusercontent.com/RedsonBr140/${_pkgname}/master/LICENSE")
sha256sums=('5b334d9468457a44032fe1ca655ac457820278ab44bf623966c3ff6d5e4e47e3'
            '843ea84c4c40e0f95f7e50627ad7d2981ff9adb74fffd36a3f800b4b4d4dbdd1')

package() {
	install -Dm755 ppfetch-rs "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

