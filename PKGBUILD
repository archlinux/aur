pkgname=goldfish-moon
pkgver=20170909
pkgrel=1
pkgdesc="Script to start Pale Moon with temporary empty profile"
arch=(any)
depends=(palemoon)
source=(goldfish-moon goldfish-moon.desktop)
sha512sums=('bf159fcee11c1b9cb13c8d4f04d8a201b5aba9b0872306a11aa1b55c3b8a84f82d82956c2c07cc9f066b8b3798e902faee716e5b7d6a669f981f92153a1753d0'
			'67fb60ef9c93acb3a8a1a6a1929873d4c217304155c5b3278188f6e310014080ef4cff4680047b5bf805421ec92f6bd2c8fcef18f701939d7fc83249dbe48381')

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}