# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
pkgname=crandpass
pkgver=6
pkgrel=3
pkgdesc="A random password generator for Linux."
arch=("any")
url="https://github.com/kitsuneflame-zz/crandpass"
license=('GPL3')
depends=("bash")
source=(https://github.com/kitsuneflame-zz/crandpass/archive/master.zip)
sha384sums=('8cbe069235a2019cf17a4aa0916582559dde60641169fa637e3dffeea8d8110e96ab4ac456d48be328ad99382b52370e')

prepare() {
	cd "$srcdir/$pkgname-master"
}





package() {
    install -D "$srcdir/$pkgname-master/src/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
