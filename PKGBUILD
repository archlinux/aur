fontname=consolas-ligaturized
pkgname="ttf-${fontname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Standard Consolas font with FiraCode ligatures.'
arch=(any)
license=(CUSTOM)
depends=(fontconfig xorg-font-utils xorg-mkfontdir)
source=("https://github.com/somq/${fontname}/archive/${pkgver}.tar.gz")
sha256sums=(92bab70e3881b45260be620fbffaf8acb1f9017f108ff06353b1e195649eef7d)

package() {
  mkdir -p "$pkgdir/usr/share/fonts/${fontname}"
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "${srcdir}/${fontname}-${pkgver}/"*.ttf "$pkgdir/usr/share/fonts/${fontname}"
  cp "${srcdir}/${fontname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}" 
}
