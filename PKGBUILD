# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-interface
pkgver=1.2
pkgrel=2
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/interface/"
arch=(any)
license=(custom:"SIL Open Font License")

source=("interface-${pkgver}.zip::https://github.com/rsms/interface/releases/download/v${pkgver}/Interface-${pkgver}.zip")
sha256sums=('82101191c72613c8a6ebf2abfabe5c30a2df5f03d5bed4ad02606fe1c9172f76')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Interface (OTF)/"*.otf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
