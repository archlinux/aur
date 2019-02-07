# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-inter-ui
pkgver=3.3
pkgrel=1
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip")
sha256sums=('b8733799800cedbc5459944ce48fbb8bb0b8fa674a865cd7359bfbaa0038fb0c')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter (TTF hinted)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
