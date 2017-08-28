# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-interface
pkgver=1.3
pkgrel=3
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/interface/"
arch=(any)
license=(custom:"SIL Open Font License")

source=("interface-${pkgver}.zip::https://github.com/rsms/interface/releases/download/v${pkgver}/Interface-${pkgver}.zip")
sha256sums=('4360516fb5d1bf0d64d86a5e03f6ec23e8c951078152197772c8a11d32eaa821')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Interface (OTF)/"*.otf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
