# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jwt-cli-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="A super fast CLI tool to decode and encode JWTs built in Rust"
arch=(x86_64)
url="https://github.com/mike-engel/jwt-cli"
license=('MIT')

conflicts=('jwt-cli' 'jwt-cli-git')
provides=('jwt')

source=("https://github.com/mike-engel/jwt-cli/releases/download/${pkgver}/jwt-linux.tar.gz")

sha256sums=('a1ee8e740ffa4c4d50893b0525e5ec05ebeaeb20217febb7bc8173ed7a23023b')

package() {
	# package
	install -D -m755 $srcdir/jwt $pkgdir/usr/bin/jwt
}
