# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-remove-dropdown-arrows
pkgver=13
pkgrel=1
pkgdesc="Removes the dropdown arrows from the AppMenu and SystemMenu"
arch=('any')
url="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows/archive/version/${pkgver}.tar.gz")
sha256sums=('ee6c20da79d26529db3d6d6e5030c26892902183983f80337f390b6e6b3ac53f')

package() {
  _uuid='remove-dropdown-arrows@mpdeimos.com'

  cd "${srcdir}/gnome-shell-remove-dropdown-arrows-version-${pkgver}"

  install -Dm644 extension.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 metadata.json -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
