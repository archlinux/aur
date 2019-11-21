# Maintainer: Sam Burgos < santiago.burgos1089@gmail.com >

pkgname=wine-installer
pkgver=4.0.5
pkgrel=2
pkgdesc='A meta-installer for Wine along with desktop files and libraries for WINE to work properly'
arch=(x86_64)
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=(GPL)
depends=(
    cups
    glu
    gpm    
    gsm
    lib32-alsa-lib
    lib32-alsa-oss
    lib32-alsa-plugins
    lib32-libcups
    lib32-glu
    lib32-gpm
    lib32-gsm
    lib32-gst-plugins-base
    lib32-gst-plugins-good
    lib32-krb5
    lib32-libcups
    lib32-libpulse
    lib32-libxcomposite
    lib32-libxslt
    lib32-mesa
    lib32-openal
    lib32-unixodbc
    lib32-sdl2
    lib32-v4l-utils
    mesa
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
