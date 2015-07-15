# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
pkgname=crandpass
pkgver=6
pkgrel=1
pkgdesc="A random password generator for Linux."
arch=("any")
url="http://kitsunerising.blogspot.com/"
license=('GPL3')
depends=("bash")
source=(https://build.opensuse.org/package/rawsourcefile/home:kitsuneflame/$pkgname/$pkgname-$pkgver.tar.gz?srcmd5=1e208bd16cea7dab8ded035562732f23)
md5sums=('5a789cdd5f68ca618e9bee27bdbc24cf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}





package() {
    install -D "$srcdir/$pkgname-$pkgver/src/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
