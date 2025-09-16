# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.6.0
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

sha256sums=('61c7dab2edb18c04e2fc89550116a824bfcfe27a0e279ba5f2570bfa4085cf6c'
            'a3d1acfb3919a73c169954d718159933c166cb3cd7ea763f7d4290b4f0d6eeff')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
