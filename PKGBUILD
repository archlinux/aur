# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="small CLI text editor. Inspired by ed"
arch=('x86_64')
url="https://github.com/Ho1Ai/in"
license=('MIT')
depends=('glibc')
provides=()
replaces=()
source=("in"
	"in-mh")

sha256sums=('7f7b35421f6e87006d9ce5303dee254b03a67653a24493c25d9e260ecccfcaa0'
            '2613eb644ffe7f3b65dee930be0d01d3529d37a67e972f76072869dbc6e61830')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
