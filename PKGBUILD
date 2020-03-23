# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase="ferrite-core"
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=2.0
pkgrel=1
pkgdesc="Ferrite Core DX font family by Froyo Tam(Meta-package with TTF and OTF variants)"
arch=('any')
url="https://github.com/froyotam/ferrite-core/"
license=('Custom')
install=
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/froyotam/ferrite-core/archive/${pkgver}.tar.gz")
noextract=()
sha256sums=('3ecd9c181e746bd2b92c5fc429cfb0a3a61456637ab5a5d6d4d46dd0ca96c7ba')

package_ttf-ferrite-core() {
  conflicts=("ttf-ferrite-core-git")
  cd "${pkgbase}-${pkgver}"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 fonts/ttf/FerriteCore-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCore-Regular.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Regular.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Medium.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Medium.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Light.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Light.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Display.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Display.ttf"
  install -Dm644 fonts/ttf/FerriteCoreDX-Black.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCoreDX-Black.ttf"
}

package_otf-ferrite-core() {
  cd "${pkgbase}-${pkgver}"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 fonts/otf/FerriteCore-Regular.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCore-Regular.otf"
  install -Dm644 fonts/otf/FerriteCoreDX-Regular.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCoreDX-Regular.otf"
  install -Dm644 fonts/otf/FerriteCoreDX-Medium.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCoreDX-Medium.otf"
  install -Dm644 fonts/otf/FerriteCoreDX-Light.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCoreDX-Light.otf"
  install -Dm644 fonts/otf/FerriteCoreDX-Display.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCoreDX-Display.otf"
  install -Dm644 fonts/otf/FerriteCoreDX-Black.otf "${pkgdir}/usr/share/fonts/OTF/FerriteCoreDX-Black.otf"
}
