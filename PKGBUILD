# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.5.0.4
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

sha256sums=('3e164cb7dba3d268ab8ebf9d75c623d6a4a9b5d47c96d9e6fec5c885c932925f'
            '34cf99367b8902541d40a3859d44a78595fa6becbb3bf76402272414dca52ec8')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
