# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-inter-ui
pkgver=3.1
pkgrel=1
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-UI-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip")
sha256sums=('07e25f3e9a1a156db36a383213c0b753fb3099c55ee84f7b0eeddbd77a7c8eca')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter UI (TTF hinted)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
