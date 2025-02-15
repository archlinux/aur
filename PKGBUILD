# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=ttf-hancomfont
pkgver=2.120
_pkgbuild=201700407
pkgrel=3
pkgdesc="A versatile typeface by Hancom Office for readability, aesthetics, and usability."
arch=('any')
license=('custom')
url="https://github.com/OctopusET/HancomFont"
source=("https://github.com/OctopusET/HancomFont/releases/download/v${pkgver}-${_pkgbuild}/HancomFont.tar.gz")
sha256sums=('483e0746c1c21ba23f66d6d2337a29145442cc707e5c620c102eaaae153dc795')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
}
