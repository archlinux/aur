# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=ttf-lastresort
pkgver=15.000
pkgrel=1
pkgdesc="Unicode last resort fallback font."
arch=('any')
url="https://github.com/unicode-org/last-resort-font"
license=('OFL')
source=(LastResortHE-$pkgver.ttf::$url/releases/download/$pkgver/LastResortHE-Regular.ttf
        LastResort-LICENSE-$pkgver::https://raw.githubusercontent.com/unicode-org/last-resort-font/$pkgver/LICENSE.md)
sha256sums=('432a3fb6e06f0479c6fcb5bcb14032eb6c697aa9577f27f08d409baf8bc911a8'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')

package() {
	install -Dm644 "LastResortHE-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/LastResortHE.ttf"
	install -Dm644 "LastResort-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/ttf-lastresort/LICENSE"
}
