# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=chromium-ublock-origin
pkgver=1.30.8
pkgrel=1
pkgdesc='An efficient blocker for Chromium'
arch=('any')
url='https://github.com/gorhill/uBlock'
license=('GPL3')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.chromium.zip")
md5sums=('29061ee0b6da694998e278a552efe224')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/uBlock0.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
