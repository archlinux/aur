# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.4.9
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('0ed38456afba4d3d182aba27f9bba8488d2bfe16bb65f6260acb973013cd0656')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
