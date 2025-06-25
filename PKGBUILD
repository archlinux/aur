pkgname=tattoy-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8fc72122918a62bc7807ad1189f0305dd15766ef1e4899f928d74f920bba70c0')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
