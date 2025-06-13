pkgname=tattoy-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('93c432de358a12a24aaccbf40efea6c15271015cb1e3505a599fcb8864373fd1')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
