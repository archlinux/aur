# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.0.2
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('f10180ad2dc9393b3b466599871a33fc873565ca8a904ccf605689f12656cd43')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/tamtam-app" "${pkgdir}/usr/bin/tamtam"
}
