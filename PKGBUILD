# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker
pkgver=27
pkgrel=1
pkgdesc="Tweaker of IBus for orientation, theme, font and ascii mode auto-switch"
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/ibus-tweakertuberry.github.com.v${pkgver}.shell-extension.zip")
sha256sums=('a1cacb95eb6d4b443c3b74f5d6b6c3f831bf455f0ce83262ae8349d88938eecb')

package() {
  chmod 644 "${srcdir}/metadata.json"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
  mv "${srcdir}/extension.js" "${srcdir}/locale" "${srcdir}/metadata.json" "${srcdir}/prefs.js" "${srcdir}/schemas" "${srcdir}/stylesheet.css" "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
}
