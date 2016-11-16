# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-remove-dropdown-arrows
pkgver=8
pkgrel=1
pkgdesc="Removes the dropdown arrows from the AppMenu and SystemMenu"
arch=('any')
url="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows/archive/version/${pkgver}.tar.gz")
sha256sums=('339c23b1722343d3b414f8ce2e33dfe892fd7a2d68236f5d795bfdbbeffcf6aa')

package() {
  _uuid='remove-dropdown-arrows@mpdeimos.com'

  cd "${srcdir}/gnome-shell-remove-dropdown-arrows-version-${pkgver}"

  install -Dm644 extension.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 metadata.json -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
