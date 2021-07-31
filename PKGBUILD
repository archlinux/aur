# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jwt-cli-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="A super fast CLI tool to decode and encode JWTs built in Rust"
arch=(x86_64)
url="https://github.com/mike-engel/jwt-cli"
license=('MIT')

conflicts=('jwt')
provides=('jwt')

source=("https://github.com/mike-engel/jwt-cli/releases/download/${pkgver}/jwt-linux.tar.gz")

sha256sums=('6b0740c3f4c7134a0cbcf802b95b033bd2246d592ad16aa2ee2d80e5b289b4d6')

package() {
	# package
	install -D -m755 $srcdir/jwt $pkgdir/usr/bin/jwt
}
