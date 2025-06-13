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
sha256sums=('e4e51d73c9fa5c12ff60e1dc53a7ac125246126b3ae0510a64a9991c0e89e85b')

package() {
	install -Dm755 tattoy -t "$pkgdir/usr/bin"
}
