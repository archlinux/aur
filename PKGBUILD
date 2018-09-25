# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.1.2
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('56ed9a6b4006a1e083542d6f27152360accd9602623840140799f5f8e9b0f7db')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/tamtam-app" "${pkgdir}/usr/bin/tamtam"
}
