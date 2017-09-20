# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-inter-ui
pkgver=1.8
pkgrel=9
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-UI-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip")
sha256sums=('e597d7287dd9000b65d0ac177402aef1f6a7cad44666e17bcf438b48c1d55e2c')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter UI (hinted TTF)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
