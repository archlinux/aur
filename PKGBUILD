# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.5.0
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

sha256sums=('0144c4837aa4c52f28a0bc7917cf9bf10a7552a355d3126e6fa0388969024cf2'
            '34cf99367b8902541d40a3859d44a78595fa6becbb3bf76402272414dca52ec8')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
