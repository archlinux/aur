#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-shobhika
pkgver=1.04
pkgrel=2
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/Sandhi-IITBombay/Shobhika"
license=('custom:OFL')
arch=(any)
srcname="Shobhika"
source=("https://github.com/Sandhi-IITBombay/$srcname/releases/download/v$pkgver/$srcname-$pkgver.zip")
md5sums=('4efc3458a78c172734b4c83dac7722cc')
package() {
	cd $srcname-$pkgver
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
