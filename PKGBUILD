# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
pkgname=crandpass
pkgver=6
pkgrel=2
pkgdesc="A random password generator for Linux."
arch=("any")
url="http://kitsunerising.blogspot.com/"
license=('GPL3')
depends=("bash")
source=(https://github.com/LookTJ/crandpass/archive/master.zip)
md5sums=('9a9e4d18540c6da9365d09ffb1f4383b')

prepare() {
	cd "$srcdir/$pkgname-master"
}





package() {
    install -D "$srcdir/$pkgname-master/src/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
