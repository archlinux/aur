# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=wine-installer
pkgver=4.0.5
pkgrel=1
pkgdesc='A meta-installer for Wine along with desktop files and libraries for WINE to work properly'
arch=(x86_64)
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=(GPL)
depends=(
    gsm
    isdn4k-utils
    lib32-glu
    lib32-gpm
    lib32-gst-plugins-base
    lib32-krb5
    lib32-libcups
    lib32-libxcomposite
    lib32-libxslt
    lib32-mesa
    lib32-sdl2
    lib32-v4l-utils
    mesa
    sane
    sdl2
    unixodbc
    wine
    wine_gecko
    wine-mono
    winetricks
)
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b360b6c34e2fbc84fd959caa204ba48c850db5fb437487ff2516e67c0632057f')

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
  cp -r etc "$pkgdir"
}