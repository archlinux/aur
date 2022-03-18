# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.37.1
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/yoheimuta/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('5fef07cb2b080830a005e5a919fa71e4b2362584a45bc4750f7adf40ccde6ee8')

package() {
	cd $srcdir
	install -Dm 0755 protolint $pkgdir/usr/bin/protolint
	install -Dm 0755 protoc-gen-protolint $pkgdir/usr/bin/protoc-gen-protolint
}
