# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=in-editor
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="small CLI text editor. Based on ed"
arch=('x86_64')
url="https://github.com/Ho1Ai/in"
license=('MIT')
provides=()
replaces=()
source=("in")
sha256sums=('b83027034cec33b438598a3818dd6d622db4bb00fbf15e853c07742a28b20739')

package() {
	install -Dm755 "$srcdir/in" "$pkgdir/usr/bin/in"
}
