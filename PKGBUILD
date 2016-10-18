# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-remove-dropdown-arrows
pkgver=7
pkgrel=1
pkgdesc="Removes the dropdown arrows from the AppMenu and SystemMenu"
arch=('any')
url="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows/archive/version/${pkgver}.tar.gz")
sha256sums=('196cc6d23b54a68550ed752a9f48b4898457d941ce69de7973fe7fe5386ca22d')

package() {
  _uuid='remove-dropdown-arrows@mpdeimos.com'

  cd "${srcdir}/gnome-shell-remove-dropdown-arrows-version-${pkgver}"

  install -Dm644 extension.js -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 metadata.json -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
