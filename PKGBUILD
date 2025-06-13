pkgname=tattoy-bin
pkgver=0
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver-test2/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('06a79f0f0bd1c4f6e6061ebb45deeec6de8f3f0f52c6abc9021c2805aca51e27')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
