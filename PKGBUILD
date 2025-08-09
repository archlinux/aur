# Contributor: Dominik Heidler <dominik@heidler.eu>
# Contributor: a821 (nospam) mail de

pkgname=pa
pkgver=0.2
pkgrel=2
pkgdesc="Password manager similar to pass but with symmetric encryption"
arch=('any')
url="https://codeberg.org/aylen384/pa"
license=('GPL-3.0-or-later')
depends=('python' 'python-gnupg' 'xclip')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('c194581faa9affb8bd982ec32e80381ac5382145b0ec62bbb119b3b19d5be143')

package() {
	cd $srcdir/$pkgname
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
