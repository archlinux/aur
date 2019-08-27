# Maintainer: Omid Momenzadeh "OmidMnz"

pkgname=kwin-script-grid-tiling
_pkgname=Grid-Tiling-Kwin
pkgver=20190827
pkgrel=1
pkgdesc="A kwin script that automatically tiles windows"
arch=('any')
url="https://github.com/lingtjien/Grid-Tiling-Kwin"
license=('GPL3')
depends=('kwin')
source=("git+https://github.com/lingtjien/Grid-Tiling-Kwin.git")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/"
  mkdir -p "${pkgdir}/usr/share/kwin/scripts/grid-tiling/"
  cp -r "contents" "${pkgdir}/usr/share/kwin/scripts/grid-tiling/contents"
  cp "metadata.desktop" "${pkgdir}/usr/share/kwin/scripts/grid-tiling/metadata.desktop"
  mkdir -p "${pkgdir}/usr/share/kservices5"
  cp "${pkgdir}/usr/share/kwin/scripts/grid-tiling/metadata.desktop" "${pkgdir}/usr/share/kservices5/${pkgname}.desktop"
}
