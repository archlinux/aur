# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker
pkgver=43
pkgrel=1
pkgdesc="Tweaker of IBus for orientation, theme, font and ascii mode auto-switch"
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell>=43.0')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/ibus-tweakertuberry.github.com.v${pkgver}.shell-extension.zip")
sha256sums=('2ddcbe532f76a7fdd5f26cf9317ed415679fc1f61c835539a1c353f5aee0fd3c')

package() {
  chmod 644 "${srcdir}/metadata.json"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${srcdir}" "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
}
