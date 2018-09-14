#Maintainer: Sanskrit Coders <sanskrit-programmers@googlegroups.com>
pkgname=fonts-sanskrit
pkgver=1.0
pkgrel=1
pkgdesc="Various unicode fonts for Sanskrit (with particular emphasis on Devanagari)."
url="http://github.com/sanskrit-coders/sanskrit-fonts"
license=('custom:OFL')
arch=(any)
source=("https://github.com/sanskrit-coders/sanskrit-fonts/archive/v$pkgver.tar.gz")
sha256sums=('004bcd3ead35844d98f629e9b466044fb91e3983c45e903fd63ef91843cc0c3f')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF/devanagari"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-devanagari-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/devanagari" -m644 *.ttf

	install -d "$pkgdir/usr/share/fonts/TTF/kannada"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-kannada-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/kannada" -m644 *.ttf

	install -d "$pkgdir/usr/share/fonts/TTF/telugu"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-telugu-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/telugu" -m644 *.ttf

	install -d "$pkgdir/usr/share/fonts/TTF/oriya"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-oriya-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/oriya" -m644 *.ttf

	install -d "$pkgdir/usr/share/fonts/TTF/tamil"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-tamil-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/tamil" -m644 *.ttf

	install -d "$pkgdir/usr/share/fonts/TTF/malayalam"
  cd $srcdir/sanskrit-fonts-$pkgver/fonts/ttf-malayalam-fonts/
	install -t "$pkgdir/usr/share/fonts/TTF/malayalam" -m644 *.ttf
#	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
