# Maintainer: dude <brrtsm at gmail dot com>

pkgname=gnome-shell-extension-bing-wallpaper
_pkgname=bing-wallpaper-gnome-extension-
pkgver=20
pkgrel=1
pkgdesc="Changes your wallpaper daily to the bing.com background image"
arch=('any')
url="https://github.com/neffo/bing-wallpaper-gnome-extension"
license=('GPL')
depends=('gnome-shell>=3.18')
source=("https://github.com/neffo/bing-wallpaper-gnome-extension/archive/v${pkgver}.tar.gz")
sha512sums=('7e9097e595cfac30c7cbb125d25be357858d4255de5794822db59a1e9466187c0518c8cccb572c2e45f66be99f96fe0267eb789ec4ffe50021515e1e787b01c4')
package() {
  _uuid='BingWallpaper@ineffable-gmail.com'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "${_pkgname}${pkgver}"
  cp -r * $_install_dir
}
