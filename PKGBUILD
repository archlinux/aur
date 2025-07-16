# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="small CLI text editor. Based on ed"
arch=('x86_64')
url="https://github.com/Ho1Ai/in"
license=('MIT')
depends=('glibc')
provides=()
replaces=()
source=("in"
	"in-mh")

sha256sums=('cc385242866f80a245a76f34d7c50fe82798ff52dddf8791030ff8f419085840'
            '3f8c257378a6815533a27cd81e559cdfca79e78b94bac84abf201d02166f31c3')
package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
