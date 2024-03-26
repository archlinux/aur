fontname=consolas-ligaturized
pkgname="ttf-${fontname}"
pkgver=3.1
pkgrel=3
pkgdesc='Standard Consolas font with FiraCode ligatures. Versions 1, 2 and 3 are included'
arch=(any)
license=(CUSTOM)
url="https://github.com/somq/${fontname}"
depends=(fontconfig xorg-mkfontdir)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(b8c7600c76698efda88441e5e016daee9f1cff1340ba4f360fce0db8f6cc0e65)

package() {
  mkdir -p "$pkgdir/usr/share/fonts/${fontname}"
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "${srcdir}/${fontname}-${pkgver}/Consolas-FiraCode_v1.206/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
  cp "${srcdir}/${fontname}-${pkgver}/Consolas-FiraCode_v2/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
  cp "${srcdir}/${fontname}-${pkgver}/Consolas-FiraCode_v3/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
  cp "${srcdir}/${fontname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}
