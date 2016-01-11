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
#source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
source=("https://extensions.gnome.org/download-extension/topIcons@adel.gadllah@gmail.com.shell-extension.zip?version_tag=5335")
sha256sums=('7d8743b1d9a57b8127b7a83af70f6ea54aa31716311aafa8564dc628cfd41b6d')

package() {
  uuid='topIcons@adel.gadllah@gmail.com'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
}
