# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez at igalia dot com>

pkgname=ttf-clear-sans
pkgver=1.00
pkgrel=3
pkgdesc="A versatile OpenType font for screen, print and Web"
arch=('any')
url="https://01.org/clear-sans"
license=('custom:Apache2')
source=("https://01.org/sites/default/files/downloads/clearsans-${pkgver}.zip")
sha256sums=('41809a296870dd7b4753d6532b4093821d61f9806281e6c053ccb11083ad1190')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 LICENSE-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
