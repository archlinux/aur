# Maintainer: Thomas Weißschuhu <aur t-8ch de>

pkgname=gem2deb
pkgver=0.30.1
pkgrel=1
pkgdesc='Debian Ruby packaging suite'
arch=('any')
url='http://packages.debian.org/sid/gem2deb'
license=('GPL3')
depends=('ruby')
source=("http://http.debian.net/debian/pool/main/g/gem2deb/gem2deb_${pkgver}.tar.xz")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/ruby/vendor_ruby/"
	cp bin/* "$pkgdir/usr/bin"
	cp -R lib/* "$pkgdir/usr/lib/ruby/vendor_ruby/"
}

sha256sums=('ae6721fe3ca8eca3a50b763bc39160535f5027ead91cdb576e84c25af8747b0a')
