fontname=consolas-ligaturized
pkgname="ttf-${fontname}"
pkgver=2
pkgrel=1
pkgdesc='Standard Consolas font with FiraCode ligatures. Versions 1 and 2 are included'
arch=(any)
license=(CUSTOM)
url="https://github.com/somq/${fontname}"
depends=(fontconfig xorg-font-utils xorg-mkfontdir)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(968eaab67578feae22f09e894e4b36f2ef0f13a777ff9f43d11e10bda4b640e7)

package() {
  mkdir -p "$pkgdir/usr/share/fonts/${fontname}"
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "${srcdir}/${fontname}-${pkgver}/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
  cp "${srcdir}/${fontname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}
