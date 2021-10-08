# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ohsnap
pkgver=1.8.0
pkgrel=1
pkgdesc="Monospaced font based on Artwiz Snap."
arch=('any')
url="http://sourceforge.net/projects/osnapfont"
license=('GPLv2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ohsnap.install
source=("http://sourceforge.net/projects/osnapfont/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('081729e01699a867b9ad792e63a17d2ab333a6073833a6a8f3f27f32fc27185f')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/local"
  install -d "${pkgdir}/usr/share/kbd/consolefonts"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 *.pcf "${pkgdir}/usr/share/fonts/local"
  install -m644 *.psfu "${pkgdir}/usr/share/kbd/consolefonts"
  install -m644 README.ohsnap "${pkgdir}/usr/share/doc/${pkgname}"
}
