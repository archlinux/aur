# Maintainer: gkmcd <g at dramati dot cc>
# Contributor: dude <brrtsm at gmail dot com>

pkgname=gnome-shell-extension-bing-wallpaper
_pkgname=bing-wallpaper-gnome-extension-
pkgver=21
pkgrel=1
pkgdesc="Changes your wallpaper daily to the bing.com background image"
arch=('any')
url="https://github.com/neffo/bing-wallpaper-gnome-extension"
license=('GPL')
depends=('gnome-shell>=3.18')
source=("https://github.com/neffo/bing-wallpaper-gnome-extension/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')
package() {
  _uuid='BingWallpaper@ineffable-gmail.com'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "${_pkgname}${pkgver}"
  cp -r * $_install_dir
}
