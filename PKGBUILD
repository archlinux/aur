# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-interface
pkgver=1.6
pkgrel=6
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/interface/"
arch=(any)
license=(custom:"SIL Open Font License")

source=("interface-${pkgver}.zip::https://github.com/rsms/interface/releases/download/v${pkgver}/Interface-${pkgver}.zip")
sha256sums=('d22c4931d7e4f4dff5705304f72a68e77287e861c7ca0c0071a205d7f9455c67')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Interface (hinted TTF)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
