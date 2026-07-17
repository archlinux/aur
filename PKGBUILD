# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=ttf-hamchorom
pkgver=2.120
_pkgbuild=201700407
pkgrel=4
pkgdesc="A versatile typeface by Hancom Office for readability, aesthetics, and usability."
arch=('any')
license=('custom')
conflicts=('ttf-hancomfont')
provides=('ttf-hancomfont')
url="https://github.com/FreeHWP/hamchorom"
source=("https://github.com/FreeHWP/hamchorom/releases/download/v${pkgver}-${_pkgbuild}/HancomFont.tar.gz")
sha256sums=('483e0746c1c21ba23f66d6d2337a29145442cc707e5c620c102eaaae153dc795')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
}
