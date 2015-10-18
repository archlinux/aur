# Maintainer: Justin Dray <justin@dray.be>
# Contributor: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-topicons
pkgver=28
pkgrel=1
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/495/topicons/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  uuid='topIcons@adel.gadllah@gmail.com'
  cd "${srcdir}/topicons-${pkgver}"

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
}
