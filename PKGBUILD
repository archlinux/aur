# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gem2deb
pkgver=0.6.1
pkgrel=1
pkgdesc='Debian Ruby packaging suite'
arch=('any')
url='http://packages.debian.org/sid/gem2deb'
license=('GPL3')
depends=('ruby')
source=("http://ftp.de.debian.org/debian/pool/main/g/gem2deb/gem2deb_${pkgver}.tar.gz")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/ruby/vendor_ruby/"
	cp bin/* "$pkgdir/usr/bin"
	cp -R lib/* "$pkgdir/usr/lib/ruby/vendor_ruby/"
}
md5sums=('fd2f91dc5bae4f93ced43aeb1b1632e1')
