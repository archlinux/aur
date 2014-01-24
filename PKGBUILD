# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=statsvn
pkgver=0.7.0
pkgrel=1
pkgdesc="retrieves information from a subversion repository (tables, charts)"
arch=('any')
url="http://sourceforge.net/projects/statsvn/"
license=('LGPL')
depends=('java-environment' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.zip statsvn)
md5sums=('94254c808ca50bd215abd0e5b20b01d6'
         '8435f081a8b7446cc9e26b13f5b76548')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 644 statsvn.jar "$pkgdir/usr/share/java/statsvn/statsvn.jar"
	install -D ../statsvn "$pkgdir/usr/bin/statsvn"
}
