# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker
pkgver=31
pkgrel=1
pkgdesc="Tweaker of IBus for orientation, theme, font and ascii mode auto-switch"
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/ibus-tweakertuberry.github.com.v${pkgver}.shell-extension.zip")
sha256sums=('3e7ca471c4dc921e742b3bfbf2579889314ab81c18ed25a3634b665994d569e4')

package() {
  chmod 644 "${srcdir}/metadata.json"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
  mv "${srcdir}"/{extension.js,fields.js,locale,metadata.json,prefs.js,schemas,stylesheet.css,ui.js} "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
}
