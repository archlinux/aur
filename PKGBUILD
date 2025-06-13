pkgname=tattoy-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a0afffb48e1cf752248571148cd41710383d3e3424bb45e21c61cba1f197d6dc')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
