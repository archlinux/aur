# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.5.0.3
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

sha256sums=('ed42b1429ee4bb4e4bb3ca3e554c55d987826ef2630100ada9a1b08474be78d3'
            '34cf99367b8902541d40a3859d44a78595fa6becbb3bf76402272414dca52ec8')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
