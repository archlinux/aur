pkgname=tattoy-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/tattoy-v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a6d810feeb139fb79db0bfd8d4957715e917a831d214c716dacbd20f76b6262c')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
