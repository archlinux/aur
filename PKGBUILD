# Maintainer: dude <brrtsm at gmail dot com>

pkgname=gnome-shell-extension-bing-wallpaper
_pkgname=bing-wallpaper-gnome-extension-
pkgver=18
pkgrel=1
pkgdesc="Changes your wallpaper daily to the bing.com background image"
arch=('any')
url="https://github.com/neffo/bing-wallpaper-gnome-extension"
license=('GPL')
depends=('gnome-shell>=3.18')
source=("https://github.com/neffo/bing-wallpaper-gnome-extension/archive/v${pkgver}.tar.gz")
sha512sums=('a9a44b0e518583c1894bfc970df4faff8da12698f6f140d12980c1e39cf9cbffa5e91248e2c2ca36dc16ebc078674350d1eda89417355e35a7c6ccae9aabdbf3')
package() {
  _uuid='BingWallpaper@ineffable-gmail.com'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -dm655 $_install_dir
  cd "${_pkgname}${pkgver}"
  cp -r * $_install_dir
}
