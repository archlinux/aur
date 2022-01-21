# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jwt-cli-bin
pkgver=5.0.2
pkgrel=1
pkgdesc="A super fast CLI tool to decode and encode JWTs built in Rust"
arch=(x86_64)
url="https://github.com/mike-engel/jwt-cli"
license=('MIT')

conflicts=('jwt-cli' 'jwt-cli-git')
provides=('jwt')

source=("https://github.com/mike-engel/jwt-cli/releases/download/${pkgver}/jwt-linux.tar.gz")

sha256sums=('caf6479023d39199b65cd8816fcb18633d93ad5342b424b9bb0664d7a622b90f')

package() {
	# package
	install -D -m755 $srcdir/jwt $pkgdir/usr/bin/jwt
}
