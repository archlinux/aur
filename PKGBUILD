# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: wayseeker <putnik.dzen at gmail dot com>

pkgname=wmauda
pkgver=0.9
pkgrel=1
pkgdesc="Remote control dockapp for audacious"
url="http://www.netswarm.net/"
license=('GPL')
depends=(audacious2)
arch=('i686' 'x86_64')
source=(http://www.netswarm.net/misc/$pkgname-$pkgver.tar.gz
	$pkgname.patch)
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         '55cd7995cfade8a8f73f7b1215efca9e')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i "$srcdir/$pkgname.patch"
  make PREFIX=/usr
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         'b96ed6dbc5d666dbdf808fea3c479c5c')
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         '2e451ec2fe32f524ec623a681d66ed0c')
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         'c78a316bdb1741a2deec9c17b1043085')
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         '5f3f37a5939358de0f92371828f672ce')
