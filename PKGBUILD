# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
pkgname=ttf-poppins
pkgver=2.000
pkgrel=0
pkgdesc='Poppins font by ITFoundry'
arch=('any')
url='https://github.com/itfoundry/poppins'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-poppins.install
source=('https://github.com/itfoundry/poppins/releases/download/v2.000/Poppins-2_000.zip')
sha256sums=('86f53a3d50baaadca0d7a1aaf4d69e4d8d3a3d8a9fe67bc3d9b0c0db000e0f39')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/OTF
  install -m 644 *.otf "${pkgdir}"/usr/share/fonts/OTF/
}
