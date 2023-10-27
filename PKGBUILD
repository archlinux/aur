# Maintainer: Qiu Mingran <408173145 _at_ qq.com>

pkgname=ttf-andikanewbasic
_pkgname=AndikaNewBasic
pkgver=5.500
pkgrel=1
pkgdesc='A limited-character-set version of Andika, based on version 5'
url='https://software.sil.org/andika/'
arch=('any')
license=('OFL')
source=("https://software.sil.org/downloads/r/andika/$_pkgname-$pkgver.zip")
b2sums=('49da073663a26c46e66d45b59390615cbf492156c9ce9ee804fe06e4b70a23d17c9ae2f9632a53dd2e96c7904c994bcfd2a9b39405d68acd16dac81a6dfdb856')

package() {
    cd $_pkgname-$pkgver
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" AndikaNewBasic-*.ttf
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
