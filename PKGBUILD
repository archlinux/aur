# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-inter-ui
pkgver=1.10
pkgrel=12
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-UI-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip")
sha256sums=('abafc30f9d2e803abcb82947ab6453a8cdb4207cc624a4f4a8cf4aa8975519e9')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter UI (TTF hinted)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
