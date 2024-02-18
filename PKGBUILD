# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.47.5
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/yoheimuta/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d8f447bd65fc60e25ecfe0dd82ba32bf203c53feeb6fc4710870a8e36c2d5589')

package() {
	cd $srcdir
	install -Dm 0755 protolint $pkgdir/usr/bin/protolint
	install -Dm 0755 protoc-gen-protolint $pkgdir/usr/bin/protoc-gen-protolint
}
