# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adp-desktop-sdk
pkgver=6.3.34
pkgrel=1
pkgdesc='ADP Desktop SDK'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=(
         'at-spi2-core'
         'attr'
         'cairo'
         'curl'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libcap'
         'libsoup'
         'libx11'
         'libxrandr'
         'pango'
         'util-linux-libs'
         'webkit2gtk'
         )

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adp-desktop-sdk.zip")
b2sums=('390bcffbca2c16f4bc8ba85844405f45c13b58c1efa1a5652431f4fb3919fef8e2812132d2ea172d918f3fb0e5be4c3a7b52bacb3f9241970b146d13a19e793d')

options=(!strip)

package() {
  install -d "${pkgdir}/opt/Autodesk/AdpDesktopSDK/bin"
  cp -ra "${srcdir}/." "${pkgdir}/opt/Autodesk/AdpDesktopSDK/bin/"
  rm "${pkgdir}/opt/Autodesk/AdpDesktopSDK/bin/adp-desktop-sdk.zip"
}
