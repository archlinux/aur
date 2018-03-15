# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.0.4
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('c90428e7a0147cf0d1b529d3c2b07ceeb465907a3b430f604ad45a1be37f51d9')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/tamtam-app" "${pkgdir}/usr/bin/tamtam"
}
