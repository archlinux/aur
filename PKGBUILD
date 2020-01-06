# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com>
pkgname='papirus-libreoffice-theme'
pkgver='20170228'
pkgrel='2'
epoch='1'
pkgdesc='Papirus theme for LibreOffice'
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/$pkgname"
license=('GPL3')
optdepends=('libreoffice')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('396402c9327506a729d3c01e339528dd5b5f9b205cb3edabca4eb85b5db5df6d')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr/lib'
}
