# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=ttf-ferrite-core
_pkgname=ferrite-core
pkgver=1.5
pkgrel=1
pkgdesc="Ferrite Core display typeface by Froyo Tam"
arch=('any')
url="https://github.com/froyotam/ferrite-core/"
license=('Custom')
conflicts=("ttf-ferrite-core-git")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/froyotam/ferrite-core/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('8557f45034c0178d01fad3d87630a7200fd45e4f133108788c1125f4cd120698')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 fonts/FerriteCore-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCore-Regular.ttf"
}
