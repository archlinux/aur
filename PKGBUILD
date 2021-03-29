# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker
pkgver=29
pkgrel=1
pkgdesc="Tweaker of IBus for orientation, theme, font and ascii mode auto-switch"
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/ibus-tweakertuberry.github.com.v${pkgver}.shell-extension.zip")
sha256sums=('5b57b97931b2716b06c7ef9ec4af8f714aeed0d73ffc7bd121e636cd24d4f33c')

package() {
  chmod 644 "${srcdir}/metadata.json"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
  mv "${srcdir}/extension.js" "${srcdir}/locale" "${srcdir}/metadata.json" "${srcdir}/prefs.js" "${srcdir}/schemas" "${srcdir}/stylesheet.css" "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
}
