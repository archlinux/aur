# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-remove-dropdown-arrows
pkgver=9
pkgrel=1
pkgdesc="Removes the dropdown arrows from the AppMenu and SystemMenu"
arch=('any')
url="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows/archive/version/${pkgver}.tar.gz")
sha256sums=('a1049c82a710765acca89a0e5c3c8f9806ffeddb7b5259583a7368fb6b436eeb')

package() {
  _uuid='remove-dropdown-arrows@mpdeimos.com'

  cd "${srcdir}/gnome-shell-remove-dropdown-arrows-version-${pkgver}"

  install -Dm644 extension.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 metadata.json -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
