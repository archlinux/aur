# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
pkgname=ttf-rajdhani
pkgver=2.000
pkgrel=0
pkgdesc='Rajdhani font by ITFoundry'
arch=('any')
url='https://github.com/itfoundry/rajdhani'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-rajdhani.install
source=('https://github.com/itfoundry/rajdhani/releases/download/v2.000/Rajdhani-2_000.zip')
sha256sums=('2dd0b14ed9989319fde8518e4b596467ae635571ffe7733d7968201d8cdeb9cf')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/OTF
  install -m 644 *.otf "${pkgdir}"/usr/share/fonts/OTF/
}
