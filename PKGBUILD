pkgname=tattoy-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=(tattoy-v$pkgver.tar.gz::"https://github.com/tattoy-org/tattoy/releases/download/tattoy-v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e3c26fe59d21ea3ba11a1d5ea7752e4516b168a13ebcba6c07a5178b21a2f3f1')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
