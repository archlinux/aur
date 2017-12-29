# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.0.0
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('36e9ec33ed4d412fc159bc041376ed6764cda2a7631d07e7b9b5456597e2484d')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/tamtam-app" "${pkgdir}/usr/bin/tamtam"
}
