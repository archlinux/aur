# Maintainer: Ho1Ai
pkgname=in-editor
pkgver=0.2.1
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

sha256sums=('d568889a4ca68ca0358a2a4d12ecbe623782a52dc9532a0409d762a5653956f7'
            'b55e584e2f39ae0b80cc6fe1c92da8af050090487c32738c9869296ceb8e18be')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
	install -Dm755 "$srcdir/in-mh" "$pkgdir/usr/bin/in-mh"
}
