# Maintainer: Ludvig Holtze <ludvighg1999 at gmail dot com>

pkgname=ttf-tratex
pkgver=1
pkgrel=1
pkgdesc="Typsnittet som används på svenska vägskyltar / The font that is used on Swedish road signs"
url="https://www.transportstyrelsen.se/sv/vagtrafik/Trafikregler/Om-vagmarken/Teckensnitt"
license=('custom')
arch=('any')
depends=()
source=('https://www.transportstyrelsen.se/globalassets/global/vag/vagmarken/teckensnitt/tratex_win.zip')
sha256sums=('d84e3526ee9e9b8fe644f2f16cb8dfd08e20c99d5c7e214dcd8355da805771ea')

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "TratexNegVersal/Win [TT]/TRATEN__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexNegVersal.ttf"
	install -m644 "TratexPosVersal/Win [TT]/TRATEP__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexPosVersal.ttf"
	install -m644 "TratexSvart/Win [TT]/TRATS___.TTF" "$pkgdir/usr/share/fonts/TTF/TratexSvart.ttf"
	install -m644 "TratexVit/Win [TT]/TRATV___.TTF" "$pkgdir/usr/share/fonts/TTF/TratexVit.ttf"
	cd Enbart*
	install -m644 "TratexNegVersalSamisk/Win [TT]/TRATEN__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexNegVersalSamisk.ttf"
	install -m644 "TratexPosVersalSamisk/Win [TT]/TRATEP__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexPosVersalSamisk.ttf"
	install -m644 "TratexSvartSamisk/Win [TT]/TRATES__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexSvartSamisk.ttf"
	install -m644 "TratexVitSamisk/Win [TT]/TRATEV__.TTF" "$pkgdir/usr/share/fonts/TTF/TratexVitSamisk.ttf"
}
