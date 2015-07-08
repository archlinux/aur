# Maintainer: Justin Dray <justin@dray.be>
# Contributor: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-topicons
pkgver=26
pkgrel=1
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/495/topicons/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
sha256sums=('952f9441825d7231b2ca1f40c8ec360b5cc0ea48ff26ca13e91c0744588d5ea0')

package() {
  uuid='topIcons@adel.gadllah@gmail.com'
  cd "${srcdir}/topicons-${pkgver}"

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
}
