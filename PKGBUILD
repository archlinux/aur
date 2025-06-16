pkgname=tattoy-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ce4826894786668e07a56eeb2902ebbea46f2be1e3c809c80c042425f713ade5')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
