# Maintainer: Justin Dray <justin@dray.be>
# Contributor: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-topicons
pkgver=27
pkgrel=1
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/495/topicons/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
sha256sums=('f4f45f7d0f8b22715a51b60e9f23919f73f6628e0f315e6dd46af8b5e8d1f47b')

package() {
  uuid='topIcons@adel.gadllah@gmail.com'
  cd "${srcdir}/topicons-${pkgver}"

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
}
