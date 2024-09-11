# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=ttf-lastresort
pkgver=16.000
pkgrel=1
pkgdesc="Unicode last resort fallback font."
arch=('any')
url="https://github.com/unicode-org/last-resort-font"
license=('OFL')
source=(LastResortHE-$pkgver.ttf::$url/releases/download/$pkgver/LastResortHE-Regular.ttf
        LastResort-LICENSE-$pkgver::https://raw.githubusercontent.com/unicode-org/last-resort-font/$pkgver/LICENSE)
sha256sums=('60c48abfc05e9f2ba33599c4dcba40105d1ece71d3761f0b26f75a38b5b17895'
            'fc8fc512b27846bdb0d6645bed8069ac87ea599548b58a8d04bc3b0ea705a9c4')

package() {
	install -Dm644 "LastResortHE-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/LastResortHE.ttf"
	install -Dm644 "LastResort-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/ttf-lastresort/LICENSE"
}
