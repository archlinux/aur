# Maintainer: Jan Max Meyer <codepilot@phorward.info>
TXT2TAGS=txt2tags
VERSION=3.3

pkgname=${TXT2TAGS}3
pkgver=$VERSION.0
pkgrel=1
epoch=
pkgdesc="A text formatting and conversion tool - New version 3"
arch=('any')
url="https://github.com/jendrikseipp/txt2tags"
license=('GPL')
conflicts=("$TXT2TAGS" "$TXT2TAGS-git")
depends=('python')
source=("https://github.com/jendrikseipp/txt2tags/archive/$VERSION.tar.gz")
sha256sums=('d7083e3e9b02cb90b5439ab19ca279710f6e36008db79bde349a6e30c253a225')

check() {
	cd "$srcdir/$TXT2TAGS-$VERSION"
	python3 setup.py check
}

package() {
	cd "$srcdir/$TXT2TAGS-$VERSION"
	python3 setup.py install
}

