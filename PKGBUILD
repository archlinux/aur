# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=ttf-ferrite-core
_pkgname=ferrite-core
pkgver=2.0
pkgrel=1
pkgdesc="Ferrite Core DX font family by Froyo Tam"
arch=('any')
url="https://github.com/froyotam/ferrite-core/"
license=('Custom')
conflicts=("ttf-ferrite-core-git")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/froyotam/ferrite-core/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('3ecd9c181e746bd2b92c5fc429cfb0a3a61456637ab5a5d6d4d46dd0ca96c7ba')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 fonts/ttf/FerriteCore-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCore-Regular.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Regular.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Medium.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Medium.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Light.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Light.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Display.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Display.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Black.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Black.ttf"
}
