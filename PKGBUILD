# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=ttf-lastresort
pkgver=14.000
pkgrel=1
pkgdesc="Unicode last resort fallback font."
arch=('any')
url="https://github.com/unicode-org/last-resort-font"
license=('OFL')
source=(LastResortHE-$pkgver.ttf::$url/releases/download/$pkgver/LastResortHE-Regular.ttf
        LastResort-LICENSE-$pkgver::https://raw.githubusercontent.com/unicode-org/last-resort-font/$pkgver/LICENSE.md)
sha256sums=('74507aa7ae9b02a469a6acbba53db83f978b76a89e8ccec95bb5bc14941588f9'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')

package() {
	install -Dm644 "LastResortHE-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/LastResortHE.ttf"
	install -Dm644 "LastResort-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/ttf-lastresort/LICENSE"
}
