# Maintainer: naruto522ru  <itachi522ru@gmail.com>
# Contributor: Anna Ivanova <kalterfx@gmail.com>
pkgname=terminus-re33
pkgver=1.0
pkgrel=1
pkgdesc="ttf version of terminus-font"
arch=(any)
depends=(fontconfig)
source=("https://www.dropbox.com/s/oqy1jrbct1t8z9r/terminus-re33.ttf")
sha256sums=("0ffa3792c453042f93161e0f84e797492d59191ad8d299c3ea9443a4235f9815")
package() {
	install -Dm644 "$srcdir/${pkgname}.ttf" \
	               "$pkgdir/usr/share/fonts/TTF/${pkgname}.ttf"
}


