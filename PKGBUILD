# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-interface
pkgver=1.4
pkgrel=4
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/interface/"
arch=(any)
license=(custom:"SIL Open Font License")

source=("interface-${pkgver}.zip::https://github.com/rsms/interface/releases/download/v${pkgver}/Interface-${pkgver}.zip")
sha256sums=('5473405101e09c5cc22b21b6f7b150068c70e9873889dca7b4f6dad1b43ee4d4')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Interface (hinted TTF)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
