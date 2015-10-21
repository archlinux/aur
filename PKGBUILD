# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Nathan Chowning <nathan@chowning.me>

pkgname=sm5-simply-love
_srcname=Simply-Love-SM5
pkgver=2.0
pkgrel=1
pkgdesc="Port of OpenITG Simply Love theme to StepMania 5"
url="https://github.com/dguzek/$_srcname"
arch=('any')
license=('custom')
source=("https://github.com/dguzek/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('9ab28e2cad046e3634f37dd7c83519cd69c0a74938aab17b11d9a48bac79d9e4')

package() {
	cd "$srcdir"
	install -d "$pkgdir/opt/stepmania/Themes"
	cp -a "$_srcname-$pkgver" "$pkgdir/opt/stepmania/Themes/Simply-Love-SM5"

	# License text
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	echo 'Copyright 2013-2015 Dan Guzek' > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
