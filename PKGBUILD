# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=ttf-lastresort
pkgver=13.000
pkgrel=1
pkgdesc="Unicode last resort fallback font."
arch=('any')
url="https://github.com/unicode-org/last-resort-font"
license=('OFL')
source=(LastResort-$pkgver.ttf::$url/releases/download/$pkgver/LastResort-regular.ttf
        LastResort-LICENSE-$pkgver::https://raw.githubusercontent.com/unicode-org/last-resort-font/$pkgver/LICENSE.md)
sha256sums=('a37c7ed1ee635138d444c81fd744a92e721e0acb5e92f9568e90fb4a9f3be264'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')

package() {
	install -Dm644 "LastResort-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/LastResort.ttf"
	install -Dm644 "LastResort-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/ttf-lastresort/LICENSE"
}
