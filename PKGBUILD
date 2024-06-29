# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=('ttf-ds-digital')
pkgver=1.0
pkgrel=1
pkgdesc="A shareware TrueType font family that can be used for digital clocks and more"
arch=('any')
url='https://www.dafont.com/ds-digital.font'
license=('custom')
depends=('fontconfig')
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=ds_digital")
sha256sums=('ee0a02681563bd40a0fd0770784b82f30f331abf5ba22d606bbdd4c93a85ddef')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir/DS-DIGI.TTF" "$pkgdir/usr/share/fonts/TTF/DS-Digi.ttf"
	install -m644 "$srcdir/DS-DIGIB.TTF" "$pkgdir/usr/share/fonts/TTF/DS-Digi-Bold.ttf"
	install -m644 "$srcdir/DS-DIGII.TTF" "$pkgdir/usr/share/fonts/TTF/DS-Digi-Italic.ttf"
	install -m644 "$srcdir/DS-DIGIT.TTF" "$pkgdir/usr/share/fonts/TTF/DS-Digi-BoldItalic.ttf"
	install -Dm644 "$srcdir/DIGITAL.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
