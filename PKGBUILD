pkgname=tattoy-bin
pkgver=${GITHUB_REF_NAME#v}
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=("MIT")
arch=("x86_64")
provides=("tattoy")
conflicts=("tattoy")
source=("https://github.com/tattoy-org/tattoy/releases/download/v$pkgver/tattoy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7607d58f1ee866ab1ee7aca8ada96c388afa099aa39f5459a602a85190ef9fff')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
