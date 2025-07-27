# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.5.0.1
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

sha256sums=('e7062994bfff3d455d1e9b38bcfe05bb617c123ddf6db5267a0bbdd73f5ad8dc'
            '34cf99367b8902541d40a3859d44a78595fa6becbb3bf76402272414dca52ec8')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
